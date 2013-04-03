require 'sidekiq'
require 'atomic'

class Sidekiq::Client
  class << self
    attr_accessor :query_time, :query_count
  end

  self.query_count = Atomic.new(0)
  self.query_time = Atomic.new(0)

  def push_with_timing(*args)
    start = Time.now
    push_without_timing(*args)
  ensure
    duration = (Time.now - start)
    Sidekiq::Client.query_time.update { |value| value + duration }
    Sidekiq::Client.query_count.update { |value| value + 1 }
  end
  alias_method_chain :push, :timing

  def push_bulk_with_timing(*args)
    start = Time.now
    push_bulk_without_timing(*args)
  ensure
    duration = (Time.now - start)
    Sidekiq::Client.query_time.update { |value| value + duration }
    Sidekiq::Client.query_count.update { |value| value + 1 }
  end
end

module Peek
  module Views
    class Sidekiq < View
      def duration
        ::Sidekiq::Client.query_time.value
      end

      def formatted_duration
        ms = duration * 1000
        if ms >= 1000
          "%.2fms" % ms
        else
          "%.0fms" % ms
        end
      end

      def calls
        ::Sidekiq::Client.query_count.value
      end

      def results
        {:duration => formatted_duration, :calls => calls}
      end

      private

      def setup_subscribers
        # Reset each counter when a new request starts
        before_request do
          ::Sidekiq::Client.query_time.value = 0
          ::Sidekiq::Client.query_count.value = 0
        end
      end
    end
  end
end

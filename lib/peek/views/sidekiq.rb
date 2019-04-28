require 'sidekiq'
require 'atomic'

module Peek
  module SidekiqInstrumented
    def push(*args)
      start = Time.now
      super(*args)
    ensure
      duration = (Time.now - start)
      ::Sidekiq::Client.query_time.update { |value| value + duration }
      ::Sidekiq::Client.query_count.update { |value| value + 1 }
    end

    def push_bulk(*args)
      start = Time.now
      super(*args)
    ensure
      duration = (Time.now - start)
      ::Sidekiq::Client.query_time.update { |value| value + duration }
      ::Sidekiq::Client.query_count.update { |value| value + 1 }
    end
  end
end

class Sidekiq::Client
  prepend Peek::SidekiqInstrumented
  class << self
    attr_accessor :query_time, :query_count
  end

  self.query_count = Atomic.new(0)
  self.query_time = Atomic.new(0)
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

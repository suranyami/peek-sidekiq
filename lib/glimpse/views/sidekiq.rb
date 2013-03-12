require 'sidekiq'

module Glimpse
  module Views
    class Sidekiq < View
      def processed
        stats.processed
      end

      def failed
        stats.failed
      end

      def enqueued
        stats.enqueued
      end

      private
      def stats
        @stats ||= Sidekiq::Stats.new
        @stats
      end
    end
  end
end

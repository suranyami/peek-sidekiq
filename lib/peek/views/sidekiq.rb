require 'sidekiq'

module Peek
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

      def results
        {
          processed: processed,
          failed: failed,
          enqueued: enqueued
         }
      end

      private
      def stats
        @stats ||= ::Sidekiq::Stats.new
        Rails.logger.debug @stats.processed
        @stats
      end

    end
  end
end

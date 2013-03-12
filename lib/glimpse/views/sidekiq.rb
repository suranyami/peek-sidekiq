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
        Rails.logger.debug @stats.processed
        @stats
      end

      def setup_subscribers
        before_request do
          stats
        end
      end

    end
  end
end

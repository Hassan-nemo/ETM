# frozen_string_literal: true
require 'zipruby'

module Etm
  module Services
    class Downloader
      ROUTES = 'the_one/routes'

      attr_reader :terminal

      def initialize(terminal)
        @terminal = terminal
      end

      def execute
        Etm::LOGGER.info('Downloading all data points...')
        download
        Etm::LOGGER.info('Download Done Succefully!')
      end

      private

      def download
        @download ||= terminal.get(path: ROUTES)
      end
    end
  end
end

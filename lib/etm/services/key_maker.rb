# frozen_string_literal: true

require 'json'

module Etm
  module Services
    class KeyMaker
      PILLS = 'the_one'

      attr_reader :terminal

      def initialize(terminal)
        @terminal = terminal
      end

      def execute
        passphrase
      end

      private

      def passphrase
        return @passphrase if @passphrase

        begin
          response = terminal.get(path: PILLS)
          @passphrase = response['pills']['red']['passphrase']
        rescue NoMethodError
          raise Etm::UnauthorizedError
        end
      end
    end
  end
end

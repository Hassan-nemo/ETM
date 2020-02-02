# frozen_string_literal: true

require 'faraday'
require 'json'
module Etm
  module Helpers
    class Terminal
      BASE_URL = 'https://challenge.distribusion.com/'

      attr_accessor :passphrase

      def initialize(passphrase)
        @passphrase = passphrase
        @connection = Faraday.new(url: BASE_URL) do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.headers['Content-Type'] = 'application/json'
          faraday.headers['Accept'] = 'application/json'
        end
      end

      def get(path: nil, params: {})
        response = connection.get do |request|
          request.url path
          request.params['passphrase'] = passphrase
          request.params.merge(params)
        end
        if response.success?
          handle_response(response)
        else
          handle_error(response)
        end
      end

      def post(path: {}, params: {})
        response = connection.post do |request|
          request.url path
          request.params['passphrase'] = passphrase
          request.body = JSON.generate(params)
        end

        response.success? ? handle_response(response) : handle_error(response)
      end

      private

      attr_reader :connection

      def handle_error(response)
        error = Etm::ERRORS[response.status]
        raise error if error

        raise Etm::UnexpectedError
      end

      def handle_response(response)
        if response.headers['content-type'] == 'application/json'
          JSON.parse(response.body)
        elsif response.headers['content-type'] == 'application/zip'
          Etm::Helpers::Extractor.execute(buffer: response.body)
        else
          response.body
        end
      end
    end
  end
end

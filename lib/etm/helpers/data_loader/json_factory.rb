# frozen_string_literal: true

require 'json'

module Etm
  module Helpers
    module DataLoader
      class JSONFactory < AbstractDataLoader
        def data
          @data ||= json_data(file)
        end

        private

        def file
          @file ||= load_file(path)
        end

        def load_file(path)
          @file = File.open path
        end

        def json_data(file)
          @json_data ||= JSON.load(file).map { |hash| symbolize(hash) }
        end
      end
    end
  end
end

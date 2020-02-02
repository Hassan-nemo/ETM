# frozen_string_literal: true

module Etm
  module Helpers
    module DataLoader
      class AbstractDataLoader
        attr_reader :path

        def initialize(path)
          raise Etm::FileNotFoundError if path.nil? || !File.exist?(path)

          @path = path
        end

        def data
          raise Etm::NotImplementedError
        end

        private

        def symbolize(hash)
          hash.keys.each do |key|
            hash[(key.to_sym rescue key) || key] = hash.delete(key)
          end
          hash
        end
      end
    end
  end
end

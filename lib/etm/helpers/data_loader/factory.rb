# frozen_string_literal: true

module Etm
  module Helpers
    module DataLoader
      class Factory
        BASE_CLASS_NAME = 'Etm::Helpers::DataLoader'
        def self.build(data_type, path)
          raise Etm::NotImplementedError if %w[CSV JSON].none?(data_type)

          factory = self.class.const_get(
            "#{BASE_CLASS_NAME}::#{data_type}Factory"
          )

          factory.new(path)
        end
      end
    end
  end
end

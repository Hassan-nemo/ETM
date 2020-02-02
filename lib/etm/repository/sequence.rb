# frozen_string_literal: true

module Etm
  module Repository
    class Sequence < BaseRepository
      FILE_LOCATION = 'sniffers/sequences.json'
      FILE_TYPE = 'JSON'

      private

      def entities
        @entities ||= data.map { |hash| Etm::Entity::SequenceEntity.new(hash) }
      end

      def file_exists?
        File.exist?(FILE_LOCATION)
      end

      def data
        @data ||= data_loader.build(FILE_TYPE, FILE_LOCATION).data
      end
    end
  end
end

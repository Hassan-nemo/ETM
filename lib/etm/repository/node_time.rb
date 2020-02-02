# frozen_string_literal: true

module Etm
  module Repository
    class NodeTime < BaseRepository
      FILE_LOCATION = 'sniffers/node_times.csv'
      FILE_TYPE = 'CSV'

      def find_by_id(id)
        entities.find { |entity| entity[:node_time_id] == id }
      end

      private

      def entities
        @entities ||= data.map { |hash| Etm::Entity::NodeTimeEntity.new(hash) }
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

# frozen_string_literal: true

module Etm
  module Repository
    class Route < BaseRepository
      FILE_LOCATION = 'sniffers/routes.csv'
      FILE_TYPE = 'CSV'

      def find_by_id(id)
        entities.find { |entity| entity[:route_id] == id }
      end

      private

      def entities
        @entities ||= data.map { |hash| Etm::Entity::RouteEntity.new(hash) }
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

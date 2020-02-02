# frozen_string_literal: true

module Etm
  module Repository
    class BaseRepository
      attr_reader :downloader, :data_loader

      def initialize(downloader)
        @downloader = downloader
        @data_loader = Etm::Helpers::DataLoader::Factory
        download_files
      end

      def all
        entities
      end

      private

      def download_files
        downloader.execute unless file_exists?
      end
    end
  end
end

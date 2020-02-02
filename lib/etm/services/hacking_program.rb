# frozen_string_literal: true

module Etm
  module Services
    class HackingProgram
      class << self
        def execute!
          Etm::LOGGER.info('Hi Neo.')
          Etm::LOGGER.info('Welcome To The Key Maker!')
          passphrase = key_maker.execute
          Etm::LOGGER.info("Your key is Ready: '#{passphrase}'")
          terminal.passphrase = passphrase
          Etm::LOGGER.info('Your Terminal Is Ready For The Hack!')
          importer.execute!
          remove_downloads
          Etm::LOGGER.info("Hack Done Succefully! Thanks Neo You're the One.")
        end

        private

        def terminal
          @terminal ||= Etm::Helpers::Terminal.new(nil)
        end

        def key_maker
          @key_maker ||= Etm::Services::KeyMaker.new(terminal)
        end

        def extractor
          @extractor ||= Etm::Helpers::Extractor
        end

        def downloader
          @downloader ||= Etm::Services::Downloader.new(terminal)
        end

        def serializer
          @serializer ||= Etm::Services::Serializer.new(downloader)
        end

        def route_params
          @route_params ||= serializer.route_params
        end

        def importer
          @importer ||= Etm::Services::Importer.new(terminal, route_params)
        end

        def remove_downloads
          FileUtils.rm_rf('sniffers')
        end
      end
    end
  end
end

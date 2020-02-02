# frozen_string_literal: true

require 'zipruby'

module Etm
  module Helpers
    class Extractor
      class << self
        def execute(buffer: '')
          Zip::Archive.open_buffer(buffer) do |archive|
            archive.each do |zip_file|
              if zip_file.directory?
                create_dirc(zip_file.name)
              else
                create_file(zip_file)
              end
            end
          end
        end

        private

        def write_file(zip_file)
          open(zip_file.name, 'wb') do |f|
            f << zip_file.read
          end
        end

        def create_dirc(name)
          FileUtils.mkdir_p(name)
        end

        def create_file(zip_file)
          dirname = File.dirname(zip_file.name)
          create_dirc(zip_file.name) unless File.exist?(dirname)
          write_file(zip_file)
        end
      end
    end
  end
end

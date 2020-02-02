# frozen_string_literal: true

require 'csv'

module Etm
  module Helpers
    module DataLoader
      class CSVFactory < AbstractDataLoader
        def data
          @data ||= csv_data
        end

        private

        def csv_data
          rows = []
          CSV.foreach(path,
                      headers: true,
                      liberal_parsing: true,
                      col_sep: ', ') do |row|
            rows << symbolize(row.to_hash)
          end
          rows
        end
      end
    end
  end
end

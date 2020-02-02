# frozen_string_literal: true

module Etm
  module Services
    class Importer
      ROUTES = 'the_one/routes'
      attr_reader :terminal, :route_params

      def initialize(terminal, route_params)
        @terminal = terminal
        @route_params = route_params
      end

      def execute!
        route_params.each do |route_param|
          imnport(route_param.attributes)
        end
      end

      private

      def imnport(route_param)
        terminal.post(path: ROUTES, params: route_param)
      end
    end
  end
end

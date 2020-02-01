# frozen_string_literal: true

module Etm
  module Entity
    class RouteEntity < ::Dry::Struct
      attribute :route_id, ::Dry::Types['integer']
      attribute :time, ISO8601_TYPE
      attribute :time_zone, TIMEZONE_TYPE
    end
  end
end

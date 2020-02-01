# frozen_string_literal: true

module Etm
  module Entity
    class RouteParamEntity < Dry::Struct
      attribute :passphrase, ::Dry::Types['string']
      attribute :start_node, AlphanumericCode
      attribute :end_node, AlphanumericCode
      attribute :start_time, ISO8601_TYPE
      attribute :end_time, ISO8601_TYPE
    end
  end
end

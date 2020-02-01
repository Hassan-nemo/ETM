# frozen_string_literal: true

module Etm
  module Entity
    class NodeTimeEntity < Dry::Struct
      attribute :node_time_id, Dry::Types['integer']
      attribute :start_node, AlphanumericCode
      attribute :end_node, AlphanumericCode
      attribute :duration_in_milliseconds, Dry::Types['integer']
    end
  end
end

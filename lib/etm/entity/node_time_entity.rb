# frozen_string_literal: true

module Etm
  module Entity
    class NodeTimeEntity < Dry::Struct
      attribute :node_time_id, Etm::Entity::Coercible::Integer
      attribute :start_node, AlphanumericCode
      attribute :end_node, AlphanumericCode
      attribute :duration_in_milliseconds, Etm::Entity::Coercible::Integer
    end
  end
end

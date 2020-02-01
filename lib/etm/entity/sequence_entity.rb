# frozen_string_literal: true

module Etm
  module Entity
    class SequenceEntity < ::Dry::Struct
      attribute :route_id, ::Dry::Types['integer']
      attribute :node_time_id, ::Dry::Types['integer']
    end
  end
end

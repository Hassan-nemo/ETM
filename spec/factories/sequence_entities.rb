# frozen_string_literal: true

FactoryBot.define do
  factory :sequence_entity, class: Hash do
    defaults = {
      "route_id": 1,
      "node_time_id": 1
    }
    initialize_with { defaults.merge(attributes) }
  end
end

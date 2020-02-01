# frozen_string_literal: true

FactoryBot.define do
  factory :node_time_entity, class: Hash do
    defaults = {
      'node_time_id': 1,
      'start_node': 'alpha',
      'end_node': 'beta',
      'duration_in_milliseconds': 1000

    }
    initialize_with { defaults.merge(attributes) }
  end
end

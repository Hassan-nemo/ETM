# frozen_string_literal: true

FactoryBot.define do
  factory :route_entity, class: Hash do
    defaults = {
      'route_id': 1,
      'time': '2030-12-31T13:00:06',
      'time_zone': 'UTC±00:00'
    }
    initialize_with { defaults.merge(attributes) }
  end
end

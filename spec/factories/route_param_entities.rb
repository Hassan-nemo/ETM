# frozen_string_literal: true

FactoryBot.define do
  factory :route_param_entity, class: Hash do
    defaults = {
      'passphrase': SecureRandom.base64(8).gsub("/","_").gsub(/=+$/,""),
      'start_node': 'alpha',
      'end_node': 'beta',
      'start_time': '2030-12-31T13:00:06',
      'end_time': '2030-12-31T13:10:06'
    }
    initialize_with { defaults.merge(attributes) }
  end
end

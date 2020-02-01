# frozen_string_literal: true

describe Etm::Entity::RouteParamEntity do
  context '#Initialize (valid)' do
    let(:route_param_entity) { build(:route_param_entity) }
    it 'initializes when values are valid' do
      actual_entity = Etm::Entity::RouteParamEntity.new(route_param_entity)
      expect(actual_entity.passphrase).to eq route_param_entity[:passphrase]
      expect(actual_entity.start_time).to eq route_param_entity[:start_time]
      expect(actual_entity.end_time).to eq route_param_entity[:end_time]
      expect(actual_entity.start_node).to eq route_param_entity[:start_node]
      expect(actual_entity.end_node).to eq route_param_entity[:end_node]
    end
  end

  context '#Initialize (invalid)' do
    let(:route_param_entity) { build(:route_param_entity) }
    %i[start_node end_node start_time end_time].each do |field|
      it "raise error if #{field} is not given" do
        route_param_entity[field] = nil
        expect { Etm::Entity::RouteParamEntity.new(route_param_entity) }.to(
          raise_error(Dry::Struct::Error)
        )
      end

      it "raise error if #{field} invalid value given" do
        route_param_entity[field] = 'invalid'
        expect { Etm::Entity::RouteParamEntity.new(route_param_entity) }.to(
          raise_error(Dry::Struct::Error)
        )
      end
    end
  end
end

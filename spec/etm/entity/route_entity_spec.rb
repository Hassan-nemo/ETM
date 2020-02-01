# frozen_string_literal: true

describe Etm::Entity::RouteEntity do
  context '#Initialize (valid)' do
    let(:route_entity) { build(:route_entity) }
    it 'initializes when values are valid' do
      actual_entity = Etm::Entity::RouteEntity.new(route_entity)
      expect(actual_entity.route_id).to eq route_entity[:route_id]
      expect(actual_entity.time).to eq route_entity[:time]
      expect(actual_entity.time_zone).to eq route_entity[:time_zone]
    end
  end

  context '#Initialize (invalid)' do
    let(:route_entity) { build(:route_entity) }
    %i[route_id time time_zone].each do |field|
      it "raise error if #{field} is not given" do
        route_entity[field] = nil
        expect { Etm::Entity::RouteEntity.new(route_entity) }.to(
          raise_error(Dry::Struct::Error)
        )
      end

      it "raise error if #{field} invalid value given" do
        route_entity[field] = 'invalid'
        expect { Etm::Entity::RouteEntity.new(route_entity) }.to(
          raise_error(Dry::Struct::Error)
        )
      end
    end
  end
end

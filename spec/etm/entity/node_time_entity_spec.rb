# frozen_string_literal: true

describe Etm::Entity::NodeTimeEntity do
  context '#Initialize (valid)' do
    let(:node_time_entity) { build(:node_time_entity) }
    it 'initializes when values are valid' do
      actual_entity = Etm::Entity::NodeTimeEntity.new(node_time_entity)
      expect(actual_entity.node_time_id).to eq node_time_entity[:node_time_id]
      expect(actual_entity.start_node).to eq node_time_entity[:start_node]
      expect(actual_entity.end_node).to eq node_time_entity[:end_node]
      expect(actual_entity.duration_in_milliseconds).to eq(
        node_time_entity[:duration_in_milliseconds])
    end
  end

  context '#Initialize (invalid)' do
    let(:node_time_entity) { build(:node_time_entity) }
    [
      :node_time_id,
      :start_node,
      :end_node,
      :duration_in_milliseconds
    ].each do |field|
      it "raise error if #{field} is not given" do
        node_time_entity[field] = nil
        expect { Etm::Entity::NodeTimeEntity.new(node_time_entity) }.to(
          raise_error(Dry::Struct::Error)
        )
      end

      it "raise error if #{field} invalid value given" do
        node_time_entity[field] = 'invalid'
        expect { Etm::Entity::NodeTimeEntity.new(node_time_entity) }.to(
          raise_error(Dry::Struct::Error)
        )
      end
    end
  end
end

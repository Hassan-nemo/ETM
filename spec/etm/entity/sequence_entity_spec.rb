# frozen_string_literal: true

describe Etm::Entity::SequenceEntity do
  context '#Initialize' do
    let(:sequence_entity) { build(:sequence_entity) }
    it 'initialize sequence_entity with a valid values' do
      actual_entity = Etm::Entity::SequenceEntity.new(sequence_entity)
      expect(actual_entity.route_id).to eq sequence_entity[:route_id]
      expect(actual_entity.node_time_id).to eq sequence_entity[:node_time_id]
    end

    it 'check if route_id is given' do
      sequence_entity[:route_id] = nil
      expect { Etm::Entity::SequenceEntity.new(sequence_entity) }.to(
        raise_error(Dry::Struct::Error)
      )
    end

    it 'check if node_time_id is given' do
      sequence_entity[:node_time_id] = nil
      expect { Etm::Entity::SequenceEntity.new(sequence_entity) }.to(
        raise_error(Dry::Struct::Error)
      )
    end

    it 'check if route_id is invalid' do
      sequence_entity[:route_id] = 'invalid'
      expect { Etm::Entity::SequenceEntity.new(sequence_entity) }.to(
        raise_error(Dry::Struct::Error)
      )
    end

    it 'check if route_id is valid' do
      sequence_entity[:node_time_id] = 'invalid'
      expect { Etm::Entity::SequenceEntity.new(sequence_entity) }.to(
        raise_error(Dry::Struct::Error)
      )
    end
  end
end

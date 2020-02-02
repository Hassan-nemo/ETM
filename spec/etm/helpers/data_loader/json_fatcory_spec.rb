# frozen_string_literal: true

describe Etm::Helpers::DataLoader::JSONFactory do
  let(:valid_path) { 'spec/tmp/sniffers/sequences.json' }
  let(:json_factory) { Etm::Helpers::DataLoader::JSONFactory.new(valid_path) }
  context '#data' do
    it 'has a symbnolized keys' do
      data = json_factory.data
      expect(data[0][:route_id]).to be_kind_of(Integer)
      expect(data[0][:node_time_id]).to be_kind_of(Integer)
    end
  end
end

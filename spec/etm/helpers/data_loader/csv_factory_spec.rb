# frozen_string_literal: true

describe Etm::Helpers::DataLoader::CSVFactory do
  context '#routes' do
    let(:routes_path) { 'spec/tmp/sniffers/routes.csv' }
    let(:routes_factory) { Etm::Helpers::DataLoader::CSVFactory.new(routes_path) }
    context '#data' do
      it 'has a symbnolized keys' do
        data = routes_factory.data
        expect(data[0][:route_id]).to be_kind_of(String)
        expect(data[0][:time]).to be_kind_of(String)
        expect(data[0][:time_zone]).to be_kind_of(String)
      end
    end
  end

  context '#node_times' do
    let(:node_time_path) { 'spec/tmp/sniffers/node_times.csv' }
    let(:node_time_factory) { Etm::Helpers::DataLoader::CSVFactory.new(node_time_path) }
    context '#data' do
      it 'has a symbnolized keys' do
        data = node_time_factory.data
        expect(data[0][:node_time_id]).to be_kind_of(String)
        expect(data[0][:start_node]).to be_kind_of(String)
        expect(data[0][:end_node]).to be_kind_of(String)
        expect(data[0][:duration_in_milliseconds]).to be_kind_of(String)
      end
    end
  end
end

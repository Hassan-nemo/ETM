# frozen_string_literal: true

describe Etm::Services::Serializer do
  let(:terminal) { Etm::Helpers::Terminal.new('passphrase') }
  let(:downloader) { Etm::Services::Downloader.new(terminal) }
  let(:serializer) { Etm::Services::Serializer.new(downloader) }

  before do
    stub_const(
      'Etm::Repository::Sequence::FILE_LOCATION',
      'spec/tmp/sniffers/sequences.json'
    )
    stub_const(
      'Etm::Repository::NodeTime::FILE_LOCATION',
      'spec/tmp/sniffers/node_times.csv'
    )
    stub_const(
      'Etm::Repository::Route::FILE_LOCATION',
      'spec/tmp/sniffers/routes.csv'
    )
  end

  context '#route_params' do
    it '#count' do
      expect(serializer.route_params.size).to eq 5
    end

    it 'check first' do
      record = serializer.route_params[0]
      expect(record[:passphrase]).to eq 'passphrase'
      expect(record[:start_node]).to eq 'lambda'
      expect(record[:end_node]).to eq 'tau'
      expect(record[:start_time]).to eq '2030-12-31T13:00:06'
      expect(record[:end_time]).to eq '2030-12-31T13:00:07'
    end
  end
end

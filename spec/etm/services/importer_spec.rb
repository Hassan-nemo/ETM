# frozen_string_literal: true

describe Etm::Services::Importer do
  let(:terminal) { Etm::Helpers::Terminal.new('passphrase') }
  let(:downloader) { Etm::Services::Downloader.new(terminal) }
  let(:serializer) { Etm::Services::Serializer.new(downloader) }

  before do
    allow_any_instance_of(Faraday::Response).to receive(:body) { {}.to_json }
    allow_any_instance_of(Faraday::Response).to receive(:headers) { json_headers }
    allow_any_instance_of(Faraday::Response).to receive(:success?) { true }
    allow_any_instance_of(Faraday::Connection).to receive(:post) { Faraday::Response.new }
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

    context '#execute!' do
      expect(serializer.execute!.size).to 5
    end
  end
end

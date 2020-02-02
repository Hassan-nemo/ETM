describe Etm::Repository::NodeTime do
  let(:terminal) { Etm::Helpers::Terminal.new(nil) }
  let(:downloader) { Etm::Services::Downloader.new(terminal) }
  let(:node_time) { Etm::Repository::NodeTime.new(downloader) }

  context 'constants' do
    it 'FILE_LOCATION' do
      expect(Etm::Repository::NodeTime::FILE_LOCATION).to eq(
        'sniffers/node_times.csv'
      )
    end

    it 'FILE_TYPE' do
      expect(Etm::Repository::NodeTime::FILE_TYPE).to eq 'CSV'
    end
  end

  context '#find_by_id' do
    it 'record exists' do
      stub_const(
        'Etm::Repository::NodeTime::FILE_LOCATION',
        'spec/tmp/sniffers/node_times.csv'
      )
      record = node_time.find_by_id(1)
      expect(record[:node_time_id]).to eq 1
    end

    it 'record does not exists' do
      stub_const(
        'Etm::Repository::NodeTime::FILE_LOCATION',
        'spec/tmp/sniffers/node_times.csv'
      )
      record = node_time.find_by_id(0)
      expect(record).to eq nil
    end
  end

  context '#all' do
    it '#count' do
      stub_const(
        'Etm::Repository::NodeTime::FILE_LOCATION',
        'spec/tmp/sniffers/node_times.csv'
      )
      records = node_time.all
      expect(records.size).to eq 4
    end
  end
end

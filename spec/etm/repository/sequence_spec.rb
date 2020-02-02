describe Etm::Repository::Sequence do
  let(:terminal) { Etm::Helpers::Terminal.new(nil) }
  let(:downloader) { Etm::Services::Downloader.new(terminal) }
  let(:sequence) { Etm::Repository::Sequence.new(downloader) }

  context 'constants' do
    it 'FILE_LOCATION' do
      expect(Etm::Repository::Sequence::FILE_LOCATION).to eq(
        'sniffers/sequences.json'
      )
    end

    it 'FILE_TYPE' do
      expect(Etm::Repository::Sequence::FILE_TYPE).to eq 'JSON'
    end
  end

  context '#all' do
    it '#count' do
      stub_const(
        'Etm::Repository::Sequence::FILE_LOCATION',
        'spec/tmp/sniffers/sequences.json'
      )
      records = sequence.all
      expect(records.size).to eq 6
    end
  end
end

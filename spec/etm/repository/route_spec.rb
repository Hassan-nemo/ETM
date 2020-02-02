describe Etm::Repository::Route do
  let(:terminal) { Etm::Helpers::Terminal.new(nil) }
  let(:downloader) { Etm::Services::Downloader.new(terminal) }
  let(:route) { Etm::Repository::Route.new(downloader) }

  context 'constants' do
    it 'FILE_LOCATION' do
      expect(Etm::Repository::Route::FILE_LOCATION).to eq(
        'sniffers/routes.csv'
      )
    end

    it 'FILE_TYPE' do
      expect(Etm::Repository::Route::FILE_TYPE).to eq 'CSV'
    end
  end

  context '#find_by_id' do
    it 'record exists' do
      stub_const(
        'Etm::Repository::Route::FILE_LOCATION',
        'spec/tmp/sniffers/routes.csv'
      )
      record = route.find_by_id(1)
      expect(record[:route_id]).to eq 1
    end

    it 'record does not exists' do
      stub_const(
        'Etm::Repository::Route::FILE_LOCATION',
        'spec/tmp/sniffers/routes.csv'
      )
      record = route.find_by_id(0)
      expect(record).to eq nil
    end
  end

  context '#all' do
    it '#count' do
      stub_const(
        'Etm::Repository::Route::FILE_LOCATION',
        'spec/tmp/sniffers/routes.csv'
      )
      records = route.all
      expect(records.size).to eq 3
    end
  end
end

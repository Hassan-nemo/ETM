# frozen_string_literal: true

describe Etm::Helpers::DataLoader::AbstractDataLoader do
  let(:valid_path) { 'spec/tmp/sniffers/routes.csv' }

  context '#new' do
    it 'has a path' do
      obj = Etm::Helpers::DataLoader::AbstractDataLoader.new(valid_path)
      expect(obj.path).to eq valid_path
    end

    it "doesn't has a path" do
      path = nil
      expect { Etm::Helpers::DataLoader::AbstractDataLoader.new(path) }.to(
        raise_error(Etm::FileNotFoundError)
      )
    end

    it 'has an invalid path' do
      path = 'invalid'
      expect { Etm::Helpers::DataLoader::AbstractDataLoader.new(path) }.to(
        raise_error(Etm::FileNotFoundError)
      )
    end
  end

  context '#data' do
    it 'returns NotImplemented Error' do
      obj = Etm::Helpers::DataLoader::AbstractDataLoader.new(valid_path)
      expect { obj.data }.to(
        raise_error(Etm::NotImplementedError)
      )
    end
  end

  context '#symbolize' do
    it 'symbolize string hash keys' do
      hash = { 'string_key' => 'value' }
      obj = Etm::Helpers::DataLoader::AbstractDataLoader.new(valid_path)
      actual_hash = obj.send(:symbolize, hash)
      expect(actual_hash[:string_key]).to eq 'value'
    end
  end
end

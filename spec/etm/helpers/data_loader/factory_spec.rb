# frozen_string_literal: true

describe Etm::Helpers::DataLoader::Factory do
  let(:valid_path) { 'spec/tmp/sniffers/routes.csv' }

  context '#build' do
    %w[CSV JSON].each do |type|
      it "has a #{type}::Factory" do
        factory = Etm::Helpers::DataLoader::Factory.build(type, valid_path)
        expect(factory.path).to eq valid_path
      end
    end
    it 'raise NotImplementedError if not a valid factory' do
      expect { Etm::Helpers::DataLoader::Factory.build('invalid', valid_path) }.to(
        raise_error(Etm::NotImplementedError)
      )
    end
  end
end

# frozen_string_literal: true

describe Etm::Services::KeyMaker do
  let(:terminal) { Etm::Helpers::Terminal.new(nil) }
  let(:headers) { { 'content-type' => 'application/json' } }
  let(:valid_response) { { pills: { red: { passphrase: 'value' } } }.to_json }
  let(:invalid_response) { {}.to_json }
  let(:key_maker) {  Etm::Services::KeyMaker.new(terminal) } 
  context '#execute' do
    it 'returns a valid response' do
      allow_any_instance_of(Faraday::Response).to receive(:body) { valid_response }
      allow_any_instance_of(Faraday::Response).to receive(:headers) { headers }
      allow_any_instance_of(Faraday::Response).to receive(:success?) { true }
      allow_any_instance_of(Faraday::Connection).to receive(:get) { Faraday::Response.new }
      expect(key_maker.execute).to eq 'value'
    end

    it 'returns invalid  response' do
      allow_any_instance_of(Faraday::Response).to receive(:body) { invalid_response }
      allow_any_instance_of(Faraday::Response).to receive(:headers) { headers }
      allow_any_instance_of(Faraday::Response).to receive(:success?) { true }
      allow_any_instance_of(Faraday::Connection).to receive(:get) { Faraday::Response.new }
      expect { key_maker.execute }.to(
        raise_error(Etm::UnauthorizedError)
      )
    end
  end
end

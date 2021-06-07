require 'spec_helper'
require 'byebug'

describe Fubber, :vcr do
  let(:fub_client) { Fubber.client }

  ## uncomment, replace TBD values with real values, and run the test to generate vcr cassette
  # before do
  #   Fubber.api_key = ''
  #   Fubber.system_key = ''
  #   Fubber.system = ''
  # end

  describe '.find_person_by_email' do
    it 'responds with expected payload' do
      response = fub_client.find_person_by_email('ilia.lobsanov@example.com')
      parsed_response = response.parsed_response
      expect(parsed_response).not_to be_nil
      expect(parsed_response.dig('people', 0, 'firstName')).to eq('Ilia')
    end
  end

  describe '.find_person_by_id' do
    it 'responds with expected payload' do
      response = fub_client.find_person_by_id(402359)
      parsed_response = response.parsed_response
      expect(parsed_response).not_to be_nil
      expect(parsed_response.dig('people', 0, 'firstName')).to eq('John')
    end
  end

  describe '.find_person_by_name' do
    it 'responds with expected payload' do
      response = fub_client.find_person_by_name('Jane Doe')
      parsed_response = response.parsed_response
      expect(parsed_response).not_to be_nil
      expect(parsed_response.dig('people', 0, 'firstName')).to eq('Jane')
    end
  end

  describe '.update_person' do
    let(:person_id) { 302155 }

    it 'responds with expected payload' do
      response = fub_client.update_person(person_id, { customLastSource: 'PIR_NA', customLastSourceTimestamp: '2021-01-15 16:47:00'})
      parsed_response = response.parsed_response
      expect(parsed_response).not_to be_nil
      expect(parsed_response.dig('id')).to eq(person_id)
    end
  end
end


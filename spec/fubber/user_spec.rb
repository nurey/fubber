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

  describe '.find_user_by_id' do
    it 'responds with expected payload' do
      response = fub_client.find_user_by_id(168)
      parsed_response = response.parsed_response
      expect(parsed_response).not_to be_nil
      expect(parsed_response.dig('users', 0, 'name')).to eq('John Agent')
    end
  end
end


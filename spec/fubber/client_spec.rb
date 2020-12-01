require 'spec_helper'

describe Fubber do
  describe '.client' do
    it 'sets up api key' do
      Fubber.api_key = 'some key'
      fub_client = Fubber.client
      expect(fub_client.class.default_options.dig(:basic_auth, :username)).to eq('some key')
    end
  end
end


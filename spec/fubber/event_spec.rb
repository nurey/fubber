require 'spec_helper'

describe Fubber, :vcr do
  let(:event) do
    JSON.parse(<<~END_JSON)
      {
        "type": "Property Inquiry",
        "message": "I am interested in 6825 Mulholland Dr, ...",
        "description": "Move-in: 12/28/2013",
        "person": {
          "firstName": "Melissa ",
          "lastName": "Hartman",
          "emails": [ { "value": "m.hartman@example.com", "type": "home" } ],
          "phones": [ { "value": "(555) 555-1234", "type": "home" } ],
          "tags": [ "Lease option" ],
          "sourceUrl": "http://click.email.zillow.com/?qs=1e120cec11e3",
          "customBirthday": "2/16/1990"
        },
        "property": {
          "street": "6825 Mulholland Dr",
          "city": "Los Angeles",
          "state": "CA",
          "code": "90068",
          "mlsNumber": "14729339",
          "price": "310000",
          "forRent": "0",
          "url": "http://www.zillow.com/homedetails/6825-Mulholland-Dr-Los-Angeles-CA-90068/2109065822_zpid/",
          "type": "Residential"
        },
        "propertySearch": {
          "type": "Lot",
          "neighborhood": "Cahuenga Pass",
          "city": "Los Angeles",
          "state": "CA",
          "code": "90068",
          "minPrice": 100000,
          "maxPrice": 500000
        },
        "campaign": {
          "source": "google",
          "medium": "organic",
          "term": "Cahuenga Pass land",
          "content": "",
          "campaign": ""
        }
      }
    END_JSON
  end

  let(:fub_client) { Fubber.client }

  describe '.find_event_by_id' do
    it 'responds with expected payload' do
      response = fub_client.find_event_by_id(7256400)
      parsed_response = response.parsed_response
      expect(parsed_response).not_to be_nil
      expect(parsed_response.dig('events', 0, 'type')).to eq('Viewed Property')
    end
  end

  describe '.create_event' do
    it 'responds with expected payload' do
      response = fub_client.create_event(event)
      parsed_response = response.parsed_response
      expect(parsed_response).not_to be_nil
      expect(parsed_response).to include(Hash['assignedTo', 'Anthony Tomasone'])
    end
  end
end


require 'rails_helper'

RSpec.describe GeocoderService do
  it 'coordinates from mapquest api' do
    VCR.use_cassette('geocoderservice') do
      location = 'denver, co'
      response = GeocoderService.get_coordinates(location)
      expect(response).to be_a Hash
      expect(response[:results]).to be_a Array
      expect(response[:results].first[:locations].first[:latLng][:lat]).to eq(39.738453)
      expect(response[:results].first[:locations].first[:latLng][:lng]).to eq(-104.984853)
    end
  end
end

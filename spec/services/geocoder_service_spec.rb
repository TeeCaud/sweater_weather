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

  it 'gives directions from mapquest api', :vcr do
    response = GeocoderService.get_directions('denver, co', 'chicago, il')
    expect(response).to be_a Hash
    expect(response[:route][:locations][0][:displayLatLng][:lat]).to eq(39.738453)
    expect(response[:route][:locations][0][:displayLatLng][:lng]).to eq(-104.984856)
    expect(response[:route][:locations][1][:displayLatLng][:lat]).to eq(41.883228)
    expect(response[:route][:locations][1][:displayLatLng][:lng]).to eq(-87.632401)
    expect(response[:route][:formattedTime]).to eq("14:24:27")
  end
end

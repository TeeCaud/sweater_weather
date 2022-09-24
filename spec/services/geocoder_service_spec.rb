require 'rails_helper'

RSpec.describe GeocoderService do
  it 'coordinates from mapquest api', :vcr do
    location = 'Chicago, IL'
    response = GeocoderService.get_coordinates(location)
    expect(response).to be_a Hash
    expect(response[:results]).to be_a Array
    expect(response[:results].first[:locations].first[:latLng][:lat]).to eq(41.883229)
    expect(response[:results].first[:locations].first[:latLng][:lng]).to eq(-87.632398)
  end
 end

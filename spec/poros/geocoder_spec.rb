require 'rails_helper'

RSpec.describe Geocoder do
  it 'exists and has attributes', :vcr do
    location = 'Chicago, IL'
    object = GeocoderFacade.get_coordinates(location)

    expect(object).to be_a(Geocoder)
    expect(object.lat).to eq(41.883229)
    expect(object.lon).to eq(-87.632398)
  end
end

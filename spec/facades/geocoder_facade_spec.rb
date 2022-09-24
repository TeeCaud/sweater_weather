require 'rails_helper'

RSpec.describe GeocoderFacade, :vcr do
  describe '#get_coordinates' do
    it 'creates object with lat and lng' do
      location = 'Chicago, IL'
      latlong = GeocoderFacade.get_coordinates(location)
      expect(latlong).to be_a(Geocoder)
      expect(latlong.lat).to eq(41.883229)
      expect(latlong.lng).to eq(-87.632398)
    end
  end
end

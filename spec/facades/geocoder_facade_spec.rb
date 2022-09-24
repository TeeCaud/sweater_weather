require 'rails_helper'

RSpec.describe GeocoderFacade, :vcr do
  describe '#get_coordinates' do
    it 'creates object with lat and lng' do
      location = 'Chicago, IL'
      latlong = GeocoderFacade.get_coordinates(location)
      expect(latlong).to be_a(Geocoder)
    end
  end
end

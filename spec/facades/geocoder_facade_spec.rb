require 'rails_helper'

RSpec.describe GeocoderFacade do
  describe '#get_coordinates', :vcr do
    it 'creates object with lat and lng' do
      location = 'Chicago, IL'
      latlong = GeocoderFacade.get_coordinates(location)
      expect(latlong).to be_a(Geocoder)
    end
  end

  describe '#get_directions', :vcr do
    it 'happy path' do
      directions = GeocoderFacade.get_directions('denver, co', 'chicago, il')
      expect(directions).to be_a(String)
      expect(directions).to_not eq('Invalid Route')
    end

    it 'sad path' do
      directions = GeocoderFacade.get_directions('denver, co', 'antartica')
      expect(directions).to be_a String
      expect(directions).to eq('Invalid Route')
    end
  end
end

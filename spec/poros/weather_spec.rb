require 'rails_helper'

RSpec.describe Weather do
  before :each do
    location = 'Chicago, IL'
    coords = GeocoderFacade.get_coordinates(location)
    @weather = WeatherFacade.weather(coords.lat, coords.lon)
  end
  it 'exists', :vcr do
    expect(@weather).to be_a(Weather)
    expect(@weather.id).to eq(nil)
  end
end

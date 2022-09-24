require 'rails_helper'

RSpec.describe WeatherService do
  it 'retrieves weather from Openweather', :vcr do
    lat = '41.883229'
    lon = '-87.632398'
    response = WeatherService.get_weather(lat, lon)
    expect(response).to be_a(Hash)
    # expect()
  end
end

require 'rails_helper'

RSpec.describe WeatherFacade, :vcr do
  describe 'weather' do
    it 'returns weather' do
      lat = '41.883229'
      lon = '-87.632398'
      weather = WeatherFacade.weather(lat, lon)
      expect(weather).to be_a(Weather)
    end
  end
end

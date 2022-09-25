require 'rails_helper'

RSpec.describe HourlyWeather, :vcr do
  describe 'hourly weather' do
    it 'exists with attributes' do
      lat = '41.883229'
      lon = '-87.632398'
      object = WeatherFacade.hourly_weather(lat, lon).first
      expect(object).to be_a HourlyWeather
      expect(object.time).to be_a String
      expect(object.temperature).to be_a Float
      expect(object.conditions).to be_a String
      expect(object.icon).to be_a String
    end
  end
end

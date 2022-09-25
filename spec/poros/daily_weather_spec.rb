require 'rails_helper'

RSpec.describe DailyWeather, :vcr do
  describe 'daily weather' do
    it 'exists with attributes' do
      lat = '41.883229'
      lon = '-87.632398'
      object = WeatherFacade.daily_weather(lat, lon).first
      expect(object).to be_a DailyWeather
      expect(object.dt).to be_a String
      expect(object.sunrise).to be_a String
      expect(object.sunset).to be_a String
      expect(object.max_temp).to be_a Float
      expect(object.min_temp).to be_a Float
      expect(object.conditions.first).to be_a String
      expect(object.icon.first).to be_a String
    end
  end
end

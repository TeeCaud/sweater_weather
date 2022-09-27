require 'rails_helper'

RSpec.describe HourlyWeather, :vcr do
  describe 'hourly weather' do
    it 'exists with attributes' do
      object = WeatherFacade.hourly_weather('denver, co').first
      expect(object).to be_a HourlyWeather
      expect(object.time).to be_a String
      expect(object.temperature).to be_a Float
      expect(object.conditions).to be_a String
      expect(object.icon).to be_a String
    end
  end
end

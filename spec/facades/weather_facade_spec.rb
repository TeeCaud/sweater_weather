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

  describe 'current weather' do
    it 'returns current weather' do
      lat = '41.883229'
      lon = '-87.632398'

      current_weather = WeatherFacade.current_weather(lat, lon)
      expect(current_weather).to be_a(CurrentWeather)
    end
  end

  describe 'daily weather' do
    it 'returns daily weather' do
      lat = '41.883229'
      lon = '-87.632398'

      daily_weather = WeatherFacade.daily_weather(lat, lon)
      expect(daily_weather.first).to be_a(DailyWeather)
    end
  end

  describe 'hourly weather' do
    it 'returns hourly weather' do
      lat = '41.883229'
      lon = '-87.632398'

      hourly_weather = WeatherFacade.hourly_weather(lat, lon)
      expect(hourly_weather.first).to be_a(HourlyWeather)
    end
  end
end

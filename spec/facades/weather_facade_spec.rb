require 'rails_helper'

RSpec.describe WeatherFacade, :vcr do
  describe 'weather' do
    it 'returns weather' do
      weather = WeatherFacade.weather('denver, co')
      expect(weather).to be_a(Weather)
    end
  end

  describe 'current weather' do
    it 'returns current weather' do
      current_weather = WeatherFacade.current_weather('denver, co')
      expect(current_weather).to be_a(CurrentWeather)
    end
  end

  describe 'daily weather' do
    it 'returns daily weather' do
      daily_weather = WeatherFacade.daily_weather('denver, co')
      expect(daily_weather.first).to be_a(DailyWeather)
    end
  end

  describe 'hourly weather' do
    it 'returns hourly weather' do
      hourly_weather = WeatherFacade.hourly_weather('denver, co')
      expect(hourly_weather.first).to be_a(HourlyWeather)
    end
  end
end

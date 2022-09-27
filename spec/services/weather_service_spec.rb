require 'rails_helper'

RSpec.describe WeatherService do
  it 'retrieves weather from Openweather' do
    VCR.use_cassette('weatherservice') do
      location = 'denver, co'
      response = WeatherService.get_weather(location)
      current = response[:current]
      expect(response).to be_a(Hash)
      expect(response).to have_key(:current)
      expect(current).to have_key(:dt)
      expect(current).to have_key(:sunrise)
      expect(current).to have_key(:sunset)
      expect(current).to have_key(:temp)
      expect(current).to have_key(:feels_like)
      expect(current).to have_key(:humidity)
      expect(current).to have_key(:uvi)
      expect(current).to have_key(:visibility)
      expect(current[:weather].first).to have_key(:description)
      expect(current[:weather].first).to have_key(:icon)

      daily = response[:daily][0]
      expect(response).to have_key(:daily)
      expect(daily).to have_key(:dt)
      expect(daily).to have_key(:sunrise)
      expect(daily).to have_key(:sunset)
      expect(daily[:temp]).to have_key(:max)
      expect(daily[:temp]).to have_key(:min)
      expect(daily[:weather].first).to have_key(:description)
      expect(daily[:weather].first).to have_key(:icon)

      hourly = response[:hourly][0]
      expect(response).to have_key(:hourly)
      expect(hourly).to have_key(:dt)
      expect(hourly).to have_key(:temp)
      expect(hourly[:weather].first).to have_key(:description)
      expect(hourly[:weather].first).to have_key(:icon)
    end
  end
end

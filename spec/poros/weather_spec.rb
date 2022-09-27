require 'rails_helper'

RSpec.describe Weather do
  before :each do
    location = 'Chicago, IL'
    @weather = WeatherFacade.weather(location)
  end
  it 'exists', :vcr do
    expect(@weather).to be_a(Weather)
    expect(@weather.id).to eq(nil)
    expect(@weather.current_weather).to be_a CurrentWeather
    expect(@weather.daily_weather.first).to be_a DailyWeather
    expect(@weather.hourly_weather.first).to be_a HourlyWeather
  end
end

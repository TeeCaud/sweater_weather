require 'rails_helper'

RSpec.describe CurrentWeather, :vcr do
  it 'exists and has attributes' do
    lat = '41.883229'
    lon = '-87.632398'
    object = WeatherFacade.current_weather(lat, lon)
    expect(object).to be_a(CurrentWeather)
    expect(object.dt).to be_a String
    expect(object.sunrise).to be_a String
    expect(object.sunset).to be_a String
    expect(object.temperature).to be_a Float
    expect(object.feels_like).to be_a Float
    expect(object.humidity).to be_a Numeric
    expect(object.uvi).to be_a Numeric
    expect(object.visibility).to be_a Numeric
    expect(object.conditions).to be_a String
    expect(object.icon).to be_a String
  end
end

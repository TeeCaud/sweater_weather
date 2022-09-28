require 'rails_helper'

RSpec.describe 'Forecast API', :vcr do
  it 'forecast by location' do
    get '/api/v1/forecasts?location=denver, co'
    expect(response).to be_successful

    parsed_json = JSON.parse(response.body, symbolize_names: true)
    forecast = parsed_json[:data]

    expect(forecast).to be_a Hash
    expect(forecast[:id]).to eq(nil)
    expect(forecast[:type]).to eq('forecast')

    current_weather = forecast[:attributes][:current_weather]
    expect(current_weather).to be_a Hash
    expect(current_weather[:dt]).to be_a String
    expect(current_weather[:sunrise]).to be_a String
    expect(current_weather[:sunset]).to be_a String
    expect(current_weather[:temperature]).to be_a Float
    expect(current_weather[:feels_like]).to be_a Float
    expect(current_weather[:humidity]).to be_a Numeric
    expect(current_weather[:uvi]).to be_a Numeric
    expect(current_weather[:visibility]).to be_a Numeric
    expect(current_weather[:conditions]).to be_a String
    expect(current_weather[:icon]).to be_a String

    expect(current_weather).to_not have_key(:pressure)
    expect(current_weather).to_not have_key(:dew_point)
    expect(current_weather).to_not have_key(:clouds)
    expect(current_weather).to_not have_key(:wind_speed)
    expect(current_weather).to_not have_key(:wind_gust)

    daily_weather_array = forecast[:attributes][:daily_weather]
    expect(daily_weather_array.count).to eq(5)
    daily_weather = forecast[:attributes][:daily_weather].first
    expect(daily_weather).to be_a Hash
    expect(daily_weather[:dt]).to be_a String
    expect(daily_weather[:sunrise]).to be_a String
    expect(daily_weather[:sunset]).to be_a String
    expect(daily_weather[:max_temp]).to be_a Float
    expect(daily_weather[:min_temp]).to be_a Float
    expect(daily_weather[:conditions]).to be_a String
    expect(daily_weather[:icon]).to be_a String

    expect(daily_weather).to_not have_key(:moonrise)
    expect(daily_weather).to_not have_key(:moonset)
    expect(daily_weather).to_not have_key(:moon_phase)
    expect(daily_weather).to_not have_key(:feels_like)
    expect(daily_weather).to_not have_key(:pressure)
    expect(daily_weather).to_not have_key(:humidity)
    expect(daily_weather).to_not have_key(:dew_point)
    expect(daily_weather).to_not have_key(:wind_speed)
    expect(daily_weather).to_not have_key(:wind_deg)
    expect(daily_weather).to_not have_key(:wind_gust)
    expect(daily_weather).to_not have_key(:weather)

    hourly_weather_array = forecast[:attributes][:hourly_weather]
    expect(hourly_weather_array.count).to eq(8)

    hourly_weather = forecast[:attributes][:hourly_weather].first
    expect(hourly_weather).to be_a Hash
    expect(hourly_weather[:time]).to be_a String
    expect(hourly_weather[:temperature]).to be_a Float
    expect(hourly_weather[:conditions]).to be_a String
    expect(hourly_weather[:icon]).to be_a String

    expect(hourly_weather).to_not have_key(:pressure)
    expect(hourly_weather).to_not have_key(:feels_like)
    expect(hourly_weather).to_not have_key(:humidity)
    expect(hourly_weather).to_not have_key(:dew_point)
    expect(hourly_weather).to_not have_key(:uvi)
    expect(hourly_weather).to_not have_key(:visibility)
    expect(hourly_weather).to_not have_key(:wind_speed)
    expect(hourly_weather).to_not have_key(:wind_deg)
    expect(hourly_weather).to_not have_key(:wind_gust)
  end
end

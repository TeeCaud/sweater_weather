require 'rails_helper'

RSpec.describe 'Road Trip Request', :vcr do
  it 'sends road trip request to user' do
    create_user ={
                  "email": "whatever@example.com",
                  "password": "password",
                  "password_confirmation": "password"
                  }

    post '/api/v1/sign-up', params: create_user

    parsed_user = JSON.parse(response.body, symbolize_names: true)
    api_key = parsed_user[:data][:attributes][:api_key]

    expect(response).to be_successful

    users_api_data = {
                      "start_city": "Denver, CO",
                      "end_city": "Chicago, IL",
                      "api_key": api_key
                      }

    post '/api/v1/road_trip', params: users_api_data
    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json).to have_key(:data)
    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:type)
    expect(json[:data]).to have_key(:attributes)

    attributes = json[:data][:attributes]

    expect(attributes).to have_key(:start_city)
    expect(attributes).to have_key(:end_city)
    expect(attributes).to have_key(:travel_time)
    expect(attributes).to have_key(:weather_at_eta)

    weather_eta = json[:data][:attributes][:weather_at_eta]

    expect(weather_eta).to have_key(:temperature)
    expect(weather_eta).to have_key(:conditions)
  end
end

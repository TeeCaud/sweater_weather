require 'rails_helper'

RSpec.describe 'Sessions', :vcr do
  it 'creates a session' do
    create_user ={
                  "email": "whatever@example.com",
                  "password": "password",
                  "password_confirmation": "password"
                  }

    post '/api/v1/sign-up', params: create_user
    expect(response).to be_successful

    login_user = {
                  "email": "whatever@example.com",
                  "password": "password",
                  }

    post '/api/v1/sessions', params: login_user
    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:data)
    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:type)
    attributes = json[:data][:attributes]
    expect(attributes).to have_key(:email)
    expect(attributes).to have_key(:api_key)
    expect(attributes[:email]).to be_a String
    expect(attributes[:api_key]).to be_a String
    expect(attributes).to_not have_key(:password)
  end

  it 'sad path for sessions' do
    create_user ={
                  "email": "whatever@example.com",
                  "password": "password",
                  "password_confirmation": "password"
                  }

    post '/api/v1/sign-up', params: create_user
    expect(response).to be_successful

    login_user = {
                  "email": "whatever23@example.com",
                  "password": "password",
                  }

    post '/api/v1/sessions', params: login_user
    expect(response).to_not be_successful
  end
end

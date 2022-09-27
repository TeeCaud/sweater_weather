require 'rails_helper'

RSpec.describe 'User API endpoint', :vcr do
  it 'can create a user' do
    body = {
            "email": "whatever@example.com",
            "password": "password",
            "password_confirmation": "password"
            }

    post '/api/v1/sign-up', params: body
    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    user = json[:data]
    expect(user).to have_key(:id)
    expect(user[:id]).to be_a String
    expect(user).to have_key(:type)
    expect(user[:type]).to be_a String
    attributes = user[:attributes]
    expect(attributes).to have_key(:email)
    expect(attributes).to have_key(:api_key)
    expect(attributes[:email]).to be_a String
    expect(attributes[:api_key]).to be_a String
    expect(attributes).to_not have_key(:password)
    expect(attributes).to_not have_key(:password_confirmation)
  end

  it 'has sad path for creating user' do
    body = {
            "email": "whatever@example.com",
            "password": "password",
            "password_confirmation": "not matching"
            }
    post '/api/v1/sign-up', params: body
    expect(response).to_not be_successful
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:password_confirmation]).to eq(["doesn't match Password"])
  end
end

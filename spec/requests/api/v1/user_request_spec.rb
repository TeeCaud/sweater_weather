require 'rails_helper'

RSpec.describe 'User API endpoint', :vcr do
  it 'can create a user' do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    body = {
            "email": "whatever@example.com",
            "password": "password",
            "password_confirmation": "password"
            }

    post '/api/v1/sign-up', params: body
    expect(response).to be_successful

    parsed_body = JSON.parse(response.body, symbolize_names: true)

    expect()


  end
end

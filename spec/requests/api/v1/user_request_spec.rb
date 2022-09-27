require 'rails_helper'

RSpec.describe 'User API endpoint', :vcr do
  it 'can create a user' do
    post 'api/v1/sign-up'
    expect(response).to be_successful

    
  end
end

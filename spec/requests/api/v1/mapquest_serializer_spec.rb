require 'rails_helper'

RSpec.describe 'Location API' do
  it 'serializes the json response', :vcr do
    query = 
     parsed_json = MapquestService.location(query)
  end
end

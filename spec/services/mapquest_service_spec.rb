require 'rails_helper'

RSpec.describe MapquestService do
  it 'retrieves map data and parses the response', :vcr do
    query = 'Chicago'
    parsed_json = MapquestService.location(query)
    expect(parsed_json).to be_a Hash
    expect(parsed_json[:results]).to be_a Array

    location = parsed_json[:results][0]
    expect(location[:providedLocation]).to include(:location)
    expect(location[:providedLocation][:location]).to be_a String
  end
 end

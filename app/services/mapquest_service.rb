class MapquestService
  class << self

    def location(query)
      get_url("/geocoding/v1/address?key=#{ENV['mapquest_api_key']}&location=#{query}")
    end

    def get_url(url)
      conn = Faraday.new(url: "http://www.mapquestapi.com") do |faraday|
        faraday.params['key'] = ENV['maquest_api_key']
      end
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end

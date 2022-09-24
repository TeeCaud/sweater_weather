class BaseService
  class << self

    def get_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def geocoder_conn
      Faraday.new(url: "https://www.mapquestapi.com") do |faraday|
        faraday.params['key'] = ENV['maquest_api_key']
      end
    end

    def weather_conn
      Faraday.new(url: "https://api.openweathermap.org") do |faraday|
        faraday.params['appid'] = ENV['weather_api_key']
      end
    end
  end
end

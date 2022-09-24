class WeatherService
  class << self

    def get_weather(lat, lon)
      response = BaseService.weather_conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude={part}&appid=#{ENV['weather_api_key']}", content_type: 'application/json')

      BaseService.get_json(response)
    end
  end
end

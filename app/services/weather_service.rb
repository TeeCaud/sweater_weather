class WeatherService
  class << self

    def get_weather(lat, lon)
      exclude = 'minutely,alerts'
      response = BaseService.weather_conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=#{exclude}&appid=#{ENV['weather_api_key']}&units=imperial", content_type: 'application/json')
      BaseService.get_json(response)
    end
  end
end

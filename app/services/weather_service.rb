class WeatherService
  class << self

    def get_weather(location)
      location = GeocoderService.get_coordinates(location)
      exclude = 'minutely,alerts'
      response = BaseService.weather_conn.get("/data/2.5/onecall?lat=#{location[:results][0][:locations][0][:latLng][:lat]}&lon=#{location[:results][0][:locations][0][:latLng][:lng]}&exclude=#{exclude}&appid=#{ENV['weather_api_key']}&units=imperial", content_type: 'application/json')

      BaseService.get_json(response)
    end
  end
end

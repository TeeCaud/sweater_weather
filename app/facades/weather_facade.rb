class WeatherFacade
  class << self

    def weather(lat, lon)
      Weather.new(WeatherService.get_weather(lat,lon))
    end
  end
end

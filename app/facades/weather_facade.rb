class WeatherFacade
  class << self

    def weather(lat, lon)
      Weather.new(WeatherService.get_weather(lat,lon))
    end

    def current_weather(lat, lon)
      CurrentWeather.new(WeatherService.get_weather(lat, lon)[:current])
    end

    def daily_weather(lat, lon)
      DailyWeather.new(WeatherService.get_weather(lat, lon)[:daily])
    end

    def hourly_weather(lat, lon)
      HourlyWeather.new(WeatherService.get_weather(lat,lon)[:hourly])
    end
  end
end

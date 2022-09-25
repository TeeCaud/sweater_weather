class WeatherFacade
  class << self

    def weather(lat, lon)
      Weather.new(WeatherService.get_weather(lat,lon))
    end

    def current_weather(lat, lon)
      CurrentWeather.new(WeatherService.get_weather(lat, lon)[:current])
    end

    def daily_weather(lat, lon)
      WeatherService.get_weather(lat, lon)[:daily].last(5).map do |day|
        DailyWeather.new(day)
      end
    end

    def hourly_weather(lat, lon)
      HourlyWeather.new(WeatherService.get_weather(lat,lon)[:hourly])
    end
  end
end

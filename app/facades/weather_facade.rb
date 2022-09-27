class WeatherFacade
  class << self

    def weather(location)
      Weather.new(WeatherService.get_weather(location))
    end

    def current_weather(location)
      CurrentWeather.new(WeatherService.get_weather(location)[:current])
    end

    def daily_weather(location)
      WeatherService.get_weather(location)[:daily].last(5).map do |day|
        DailyWeather.new(day)
      end
    end

    def hourly_weather(location)
      WeatherService.get_weather(location)[:hourly].last(8).map do |hour|
        HourlyWeather.new(hour)
      end
    end
  end
end

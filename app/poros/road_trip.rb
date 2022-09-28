class RoadTrip
  attr_reader :id, :start_city, :end_city, :travel_time, :weather_at_eta
  def initialize(data)
    @id = nil
    @start_city = data[1]
    @end_city = data[2]
    @weather_at_eta = destination_weather(@end_city, get_hours(data[0]))
    @travel_time = format_travel_time(data[0])
  end

  private

  def format_travel_time(time)
    if self.get_hours(time) < 24
    time.to_datetime.strftime("%H hours, %M minutes")
    else
      day = time.split(':')[0].to_i/24
      hours = time.split(':')[0].to_i - day * 24
      "#{day} days, #{hours} hours"
    end
  end

  def destination_weather(location, index)
    if index < 48
    eta_weather = WeatherService.get_weather(location)[:hourly][index - 1]
    { temperature: eta_weather[:temp], conditions: eta_weather[:weather][0][:description] }
  else
    day = index / 24 - 1
    daily_weather = WeatherService.get_weather(location)[:daily][day]
    { temperatire: daily_weather[:temp][:day].to_i, conditions: daily_weather[:weather][0][:description] }
  end
  end

  def get_hours(time)
    array = time.split(':')
    array[0].to_i
  end
end

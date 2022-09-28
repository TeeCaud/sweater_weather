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
    time.to_datetime.strftime("%H hours, %M minutes")
  end

  def destination_weather(location, index)
    eta_weather = WeatherService.get_weather(location)[:hourly][index - 1]
    { temperature: eta_weather[:temp], conditions: eta_weather[:weather][0][:description] }
  end

  def get_hours(time)
      time.to_datetime.strftime("%H").to_i
  end
end

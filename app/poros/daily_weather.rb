class DailyWeather
attr_reader :dt, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon

  def initialize(data)
    @dt = Time.at(data[:dt]).to_datetime.strftime("%Y-%m-%d %H:%M:%S %z")
    @sunrise = Time.at(data[:sunrise]).to_datetime.strftime("%Y-%m-%d %H:%M:%S %z")
    @sunset = Time.at(data[:sunset]).to_datetime.strftime("%Y-%m-%d %H:%M:%S %z")
    @max_temp = data[:temp][:max]
    @min_temp = data[:temp][:min]
    @conditions = data[:weather].
    first[:description]
    @icon = data[:weather].first[:description]
  end
end

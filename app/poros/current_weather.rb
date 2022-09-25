class CurrentWeather
attr_reader :dt, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon

  def initialize(data)
    @dt = Time.at(data[:dt]).to_datetime.strftime("%Y-%m-%d %H:%M:%S %z")
    @sunrise = Time.at(data[:sunrise]).to_datetime.strftime("%Y-%m-%d %H:%M:%S %z")
    @sunset = Time.at(data[:sunset]).to_datetime.strftime("%Y-%m-%d %H:%M:%S %z")
    @temperature = data[:temp]
    @feels_like = data[:feels_like]
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @visibility = data[:visibility]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:description]
  end
end

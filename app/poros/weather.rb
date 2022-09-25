class Weather
  attr_reader :id
  def initialize(data)
    @id = nil
    @current = data[:current]
  end
end

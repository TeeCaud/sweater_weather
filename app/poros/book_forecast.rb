class BookForecast
  attr_reader :id, :destination, :forecast, :total_books_found, :books
  def initialize(data)
    @id = nil
    @destination = data[3]
    @forecast = {'summary': "#{data[1].conditions}", 'temperature': "#{data[1].temperature} F"}
    @total_books_found = data[0]
    @books = data[2]
  end
end

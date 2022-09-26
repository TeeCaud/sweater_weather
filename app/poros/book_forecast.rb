class BookForecast
  attr_reader :destination, :forecast, :total_books_found, :books
  def initialize(data)
    @destination = data[3]
    @forecast = {'summary': "#{data[1].conditions}", 'temperature': "#{data[1].temperature} F"}
    @total_books_found = data[0]
    @books = data[2]
  end
end

class BookFacade
  class << self

    def get_books(location, quantity)
      b_json = BookService.get_book(location, quantity)
      books = b_json[:docs].map { |book| Book.new(book) }
      weather = CurrentWeather.new(WeatherService.get_weather(location)[:current])
      BookForecast.new([b_json[:numFound], weather, books, b_json[:q]])
      end
    end
  end

class BookFacade
  class << self

    def get_books(city, quantity)
      BookService.get_book(city, quantity)[:docs].map do |book|
        Book.new(book)
      end
    end

    def book_forecast(city, quantity)
      result = BookService.get_book(city, quantity)
      coords = GeocoderService.get_coordinates(city)
      lat = coords[:results][0][:locations][0][:latLng][:lat]
      lon = coords[:results][0][:locations][0][:latLng][:lng]
      weather_service = WeatherService.get_weather(lat, lon)
      weather = CurrentWeather.new(WeatherService.get_weather(lat, lon)[:current])
      books = BookService.get_book(city, quantity)[:docs].last(5).map do |book|
        Book.new(book)
      end
      BookService.get_book(city, quantity)[:docs].map do |book|
        BookForecast.new([result[:numFound], weather, books, result[:q]])
      end
    end
  end
end

class BookService
  class << self

    def get_book(city, quantity)
      city = 'chicago'
      quantity = 5
      response = BaseService.book_conn.get("http://openlibrary.org/search.json?q=#{city}&limit=#{quantity}")
      BaseService.get_json(response)
    end
  end
end

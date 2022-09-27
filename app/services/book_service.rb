class BookService
  class << self

    def get_book(location, quantity)
      response = BaseService.book_conn.get("/search.json?q=#{location}&limit=#{quantity}")
      BaseService.get_json(response)
    end
  end
end

class BookService
  class << self

    def get_book(query)
      query = 'shiloh'
      response = BaseService.book_conn.get("http://openlibrary.org/search.json?q=#{query}")
      BaseService.get_json(response)
    end
  end
end

class BookService
  class << self

    def get_book(id)
      response = BaseService.book_conn.get("http://openlibrary.org/search.json?q=shiloh")
      BaseService.get_json(response)
    end
  end
end

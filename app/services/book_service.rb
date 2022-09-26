class BookService
  class << self

    def get_book(id)
      response = BaseService.book_conn.get("/api/books?bibkeys=ISBN:#{id}&jscmd=data&format=json")
      BaseService.get_json(response)
    end
  end
end

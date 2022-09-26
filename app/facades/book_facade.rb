class BookFacade
  class << self

    def get_books(id)
      Book.new(BookService.get_book(id)
    end
  end
end

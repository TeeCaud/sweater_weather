class BookFacade
  class << self

    def get_book(id)
      Book.new(BookService.get_book(id))
    end
  end
end

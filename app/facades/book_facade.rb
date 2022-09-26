class BookFacade
  class << self

    def get_books(query, quantity)
      BookService.get_book(query)[:docs].map do |book|
        Book.new(book)
      end
    end
  end
end

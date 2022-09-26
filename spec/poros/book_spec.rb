require 'rails_helper'

RSpec.describe Book, :vcr do
  describe 'books' do
    it 'exists with attributes' do
      query = 'shiloh'
      books = BookFacade.get_books(query)
      book = books.first
      
      expect(book).to be_a Book
      expect(book.isbn).to be_a Array
      expect(book.title).to be_a String
      expect(book.publisher).to be_a Array
    end
  end
end

require 'rails_helper'

RSpec.describe BookForecast, :vcr do
  it 'exists with attributes' do
    book = BookFacade.get_books('denver, co', 5)
    expect(book).to be_a BookForecast
    expect(book.destination).to be_a String
    expect(book.forecast).to be_a Hash
    expect(book.total_books_found).to be_a Integer
    expect(book.books).to be_a Array
  end
end

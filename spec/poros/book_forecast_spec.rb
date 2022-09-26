require 'rails_helper'

RSpec.describe BookForecast, :vcr do
  it 'exists with attributes' do
    city = 'chicago'
    quantity = 5
    books = BookFacade.book_forecast(city, quantity)
    book = books.first
    expect(book).to be_a BookForecast
    expect(book.destination).to be_a String
    expect(book.forecast).to be_a Hash
    expect(book.total_books_found).to be_a Integer
    expect(book.books).to be_a Array
  end
end

require 'rails_helper'

RSpec.describe 'Book request by city' do

  it 'gives books by search', :vcr do
    # city = 'chicago'
    # quantity = 5
    # lat = '41.883229'
    # lon = '-87.632398'


    get '/api/v1/book-search?location=denver,co&quantity=5'
    expect(response).to be_successful

    parsed_json = JSON.parse(response.body, symbolize_names: true)
    book_search = parsed_json[:data]

    expect(book_search).to be_a Hash
    expect(book_search[:id]).to eq(nil)
    expect(book_search[:type]).to eq('books')

    expect(book_search).to have_key(:attributes)
    attributes = book_search[:attributes]
    expect(attributes.destination).to be_a String
    expect(attributes).to have_key(:forecast)
    expect(attributes[:forecast].summary).to be_a String
    expect(attributes[:forecast].temperature).to be_a String
    expect(attributes.total_books_found).to be_a Integer
    expect(attributes.books).to be_a Array
    expect(attributes.books.first).to be_a Hash
    expect(attributes.books.first).to have_key(:isbn)
    expect(attributes.books.first).to have_key(:title)
    expect(attributes.books.first).to have_key(:publisher)
    expect(attributes.books.first[:title]).to be_a String
    expect(attributes.books.first[:publisher]).to be_a Array
  end
end

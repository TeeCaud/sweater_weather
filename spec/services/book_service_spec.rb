require 'rails_helper'

RSpec.describe BookService, :vcr do
  it 'retrieves books from Openlibrary' do
    query = 'shiloh'
    response = BookService.get_book(query)
    first_book = response[:docs].first
    expect(response).to be_a Hash
    expect(response).to have_key(:numFound)
    expect(first_book).to have_key(:isbn)
    expect(first_book).to have_key(:title)
    expect(first_book).to have_key(:publisher)
  end
end

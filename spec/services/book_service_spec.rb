require 'rails_helper'

RSpec.describe BookService do
  it 'retrieves books from Openlibrary' do
      VCR.use_cassette('bookservice') do
      location = 'chicago'
      quantity = 5
      response = BookService.get_book(location, quantity)
      first_book = response[:docs][0]
      expect(response).to be_a Hash
      expect(response).to have_key(:numFound)
      expect(first_book).to have_key(:isbn)
      expect(first_book).to have_key(:title)
      expect(first_book).to have_key(:publisher)
    end
  end
end

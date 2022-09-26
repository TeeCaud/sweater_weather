require 'rails_helper'

RSpec.descrbie BookService do
  it 'retrieves books from Openlibrary' do
    id = 0201558025
    reponse = BookService.get_book(id)
    expect(response).to be(successful)
    expect(response).to be_a Hash
    expect(response).to be_have(:ISBN)
    expect(response[:ISBN]).to be_have(:title)
    expect(response[:ISBN]).to be_have(:publishers)
  end
end

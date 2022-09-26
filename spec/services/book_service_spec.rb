require 'rails_helper'

RSpec.describe BookService, :vcr do
  it 'retrieves books from Openlibrary' do
    id = '0201558025'
    response = BookService.get_book(id)
    expect(response).to be_a Hash
    expect(response).to have_key(:"ISBN:#{id}")
    expect(response[:"ISBN:#{id}"]).to have_key(:title)
    expect(response[:"ISBN:#{id}"]).to have_key(:publishers)
  end
end

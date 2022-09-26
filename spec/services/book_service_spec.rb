require 'rails_helper'

RSpec.descrbie BookService do
  it 'retrieves books from Openlibrary' do
    reponse = BookService.get_book(id)
    expect()
  end
end

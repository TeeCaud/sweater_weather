require 'rails_helper'

RSpec.describe Book, :vcr do
  describe 'books' do
    it 'exists with attributes' do
      id = '0201558025'
      object = BookFacade.get_book(id)

      expect(object).to be_a Book
      expect(object.isbn).to be_a String
      expect(object.title).to be_a String
      expect(object.publisher).to be_a Array
    end
  end
end

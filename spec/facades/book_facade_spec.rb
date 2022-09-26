require 'rails_helper'

RSpec.describe BookFacade, :vcr do
  describe "#getbook" do
    it 'creates object with ISBN id' do
      search = 'shiloh'
      book = BookFacade.get_book(id)
      expect(book).to be_a Book
    end
  end
end

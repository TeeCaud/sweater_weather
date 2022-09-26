require 'rails_helper'

RSpec.describe BookFacade, :vcr do
  describe "#getbook" do
    it 'creates object' do
      query = 'shiloh'
      book = BookFacade.get_books(query)
      expect(book.first).to be_a Book
    end
  end
end

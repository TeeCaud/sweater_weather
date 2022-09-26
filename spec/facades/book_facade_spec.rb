require 'rails_helper'

RSpec.describe BookFacade, :vcr do
  describe "#getbook" do
    it 'creates object with ISBN id' do
      id = '0201558025'
      book = BookFacade.get_book(id)
      expect(book).to be_a BooK
    end
  end
end

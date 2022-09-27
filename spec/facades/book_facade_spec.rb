require 'rails_helper'

RSpec.describe BookFacade do
  describe "#getbook" do
    it 'creates object', :vcr do
      city = 'chicago'
      quantity = 5
      book = BookFacade.get_books('denver', 5)
      expect(book).to be_a BookForecast
    end
  end
end

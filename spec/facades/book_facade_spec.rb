require 'rails_helper'

RSpec.describe BookFacade, :vcr do
  describe "#getbook" do
    it 'creates object' do
      city = 'chicago'
      quantity = 5
      book = BookFacade.get_books(city, quantity)
      expect(book.first).to be_a Book
    end

    it 'creates objects with weather details', :vcr do
      city = 'chicago'
      quantity = 5
      location = "chicago, il"
      lat = '41.883229'
      lon = '-87.632398'

      book = BookFacade.book_forecast(city, quantity)
      expect(book.first).to be_a BookForecast
    end
  end
end

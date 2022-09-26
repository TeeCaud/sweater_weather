class Api::V1::BooksController < ApplicationController

  def search
    binding.pry
    render json:
    BookSerializer.new(BookFacade.book_forecast(params[:location], params[:quantity]))
  end
end

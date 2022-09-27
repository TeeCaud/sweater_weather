class Api::V1::BooksController < ApplicationController

  def search
    render json:
    BookSerializer.new(BookFacade.get_books(params[:location], params[:quantity]))
  end
end

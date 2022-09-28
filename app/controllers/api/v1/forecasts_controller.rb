class Api::V1::ForecastsController < ApplicationController

  def index
    render json: ForecastSerializer.new(WeatherFacade.weather(params[:location]))
  end
end

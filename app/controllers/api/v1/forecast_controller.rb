class Api::V1::ForecastController < ApplicationController

  def index
    coords = GeocoderFacade.get_coordinates(params[:location])
    weather = WeatherFacade.weather(coords.lat, coords.lon)
    render json: ForecastSerializer.new(weather)
  end
end

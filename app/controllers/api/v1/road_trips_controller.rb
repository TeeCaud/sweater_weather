class Api::V1::RoadTripsController < ApplicationController

  def create
    binding.pry
    user = User.find_by(api_key: params[:api_key])
    if user.present?
      travel_time = GeocoderFacade.get_directions(params[:start_city], params[:end_city])
      road_trip = RoadTrip.new([travel_time, params[:start_city], params[:end_city]])
      render json: RoadTripSerializer.new(road_trip), status: :created
    else
      render json: { error: 'Bad credentials' }, status: :unauthorized
    end
  end
end

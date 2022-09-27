class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:id] = user.id
      render json: UserSerializer.new(user), status: :created
    else
      render json: { error: 'Incorrect email, or password' }, status: :unauthorized
    end
  end
end

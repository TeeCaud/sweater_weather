Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecasts
      get '/book-search', to: 'books#search'
      post '/sign-up', to: 'users#create'
      post '/sessions', to: 'sessions#create'
      post '/road_trip', to: 'road_trips#create'
    end
  end
end

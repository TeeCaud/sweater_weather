Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast
      get '/book-search', to: 'books#search'
      post '/sign-up', to: 'users#create'
      post '/sessions', to: 'sessions#create'
    end
  end
end

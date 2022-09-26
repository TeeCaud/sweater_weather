Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast
      get '/book-search', to: 'books#search'
    end
  end
end

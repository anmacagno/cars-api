# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :brands, only: %i[index create]
      resources :models, only: %i[index update]
      get '/brands/:id/models', to: 'brands/models#index'
      post '/brands/:id/models', to: 'brands/models#create'
    end
  end
end

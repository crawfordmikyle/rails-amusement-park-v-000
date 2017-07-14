Rails.application.routes.draw do

  # roots
  root to: "application#index"

  # sessions
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  # rides
  post "/rides/create", to: "rides#create"

  resources :attractions

  resources :users

end

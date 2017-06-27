Rails.application.routes.draw do

  #devise_for :vehicles
  use_doorkeeper
  devise_for :user
  devise_for :vehicle

  resources :companies
  resources :bus_routes
  resources :vehicles

  mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin'
  mount API::Base, at: "/viveApi"

  root to: "basic#welcome"

  get 'maps/index_map'
  get 'basic/welcome'
  get 'basic/updateVehicleLocations'

  post 'maps/updateLocations'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

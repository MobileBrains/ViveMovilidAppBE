Rails.application.routes.draw do


  #devise_for :vehicles

  devise_for :user, path: 'users'
  devise_for :vehicle, path: 'vehicles'

  resources :companies
  resources :bus_routes
  resources :vehicles
  use_doorkeeper

  mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin'
  mount API::Base, at: "/viveApi"

  root to: "basic#landing"

  get 'maps/index_map'
  get 'maps/monitorFleet'
  get 'maps/updateMonitorFleet'
  get 'maps/updateMonitorFleetPerBusRoute'
  post 'maps/updateLocations'


  get 'basic/landing'
  get 'basic/welcome'
  get 'basic/updateVehicleLocations'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

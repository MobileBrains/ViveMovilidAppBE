Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin'
  mount API::Base, at: "/api"

  root to: "basic#welcome"

  get 'basic/welcome'

  devise_for :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
# config/routes.rb
  resources :users  # This generates RESTful routes for UsersController
  # ...
  class UsersController < ApplicationController
    # ... # Set the root page to the UsersController's index action


end

# config/routes.rb

Rails.application.routes.draw do
  resources :comments
  resources :blogs
  get 'home/index'
  devise_for :users

  devise_scope :user do
    root 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end

  
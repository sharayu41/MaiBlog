# config/routes.rb

Rails.application.routes.draw do
  resources :comments
  get 'home/index'
  devise_for :users

  devise_scope :user do
    root 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end 

  resources :blogs do
    get 'like', to: 'likes#create'
    get 'unlike', to: 'likes#destroy'
  end

end

  
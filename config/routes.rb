# config/routes.rb

Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root 'devise/sessions#new'
    get 'home/index'
    get '/users/sign_out' => 'devise/sessions#destroy'
  
  end

end
  
# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
    before_action :authenticate_user!
  
    def after_sign_in_path_for(user)
      # your path goes here
      user_posts_path(user) # as an example
    end
  
    
  end
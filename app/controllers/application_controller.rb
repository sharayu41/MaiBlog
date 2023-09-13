# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    def after_sign_in_path_for(user)
      blogs_path

    end
  
    
  end
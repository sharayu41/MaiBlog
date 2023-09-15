# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    def after_sign_in_path_for(user)
      blogs_path      
    end
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected


   def configure_permitted_parameters
    attributes = [:profile]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
   end

  
    
  end
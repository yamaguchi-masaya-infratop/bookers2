class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!, except: [:top, :about]
    
    def after_sign_in_path_for(resource)
        flash[:notice] = "Login was successful"
        books_path
    end
    
    def after_sign_out_path_for(resource)
        flash[:notice] = "Logout was successful"
        about_path
    end
    
    protected 
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
    end
end

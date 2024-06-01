class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to new_user_session_path, alert: exception.message
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :email, :password, :password_confirmation])
        devise_parameter_sanitizer.permit(:account_update, keys: [:nombre, :email, :password, :password_confirmation, :current_password])
    end

    def after_sign_up_path_for(resource)
        new_user_session_path
    end
end

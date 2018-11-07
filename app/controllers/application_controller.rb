class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permit the about_me, purpose, avatar, email, password, username and mentor parameters on signup.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password_confirmation, :about_me, :purpose, :avatar, :email, :password, :username, :mentor, :ageconfirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:about_me, :purpose, :avatar, :username, :email, :password, :password_confirmation, :mentor])
  end
end

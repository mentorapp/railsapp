class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permit the about_me, purpose and avatar parameters on signup.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:about_me, :purpose, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:about_me, :purpose, :avatar])
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :update_permitted_parameters, if: :devise_controller?

  protected

  def update_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :bio, :photo, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email bio photo password current_password])
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :authorize_user, unless: :devise_controller?
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :surname, :email, :password, :current_password)
    end
  end

  def authorize_user
    return if user_signed_in? || request.path == '/'

    redirect_to new_user_session_path, alert: 'You are not authorized to access this page.'
  end
end

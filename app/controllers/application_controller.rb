# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def logged_in?
    return unless current_user.nil?

    flash[:danger] = 'Please login'
    redirect_to new_user_registration_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
  end

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource_or_scope)
    new_user_registration_path
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end

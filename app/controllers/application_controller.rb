class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:description, :email, :password, address_attributes: [:address_1, :address_2, :city, :state, :country, :postal_code]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username,:description, :email, :password, :current_password])
  end
end

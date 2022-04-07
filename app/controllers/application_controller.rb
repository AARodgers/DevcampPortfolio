class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_filter means before you run any other controller because all inherit from this one, run the
  # :configure_permitted_parameters method but only if there is a devise controller action
  # i want to create a method and have it run anytime your communicating with devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    # these are devise methods
  end
end

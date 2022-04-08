# helper logic is going to be a module
# name of module has to be same as file name and each word sep by _ capitalized
# concerns allow you to include before filters or before_action using include
module DeviseWhitelist
  # to give us all of the methods within ActiveSupport
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action means before you run any other controller call the
  # :configure_permitted_parameters method but only if there is a devise controller action
  # i want to create a method and have it run anytime your communicating with devise
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    # these are devise methods
  end
end

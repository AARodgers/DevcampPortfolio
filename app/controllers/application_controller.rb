class ApplicationController < ActionController::Base
  # ApplicationController is the parent controller of all other child controllers, meaning it's functions are accessible to the child controllers
  protect_from_forgery with: :exception
  # to include this module, is better practice to include a module here than put all of the logic/methods here
  include DeviseWhitelist
  include SetSource
end

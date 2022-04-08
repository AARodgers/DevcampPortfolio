class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # to include this module, is better practice to include a module here than put all of the logic/methods here
  include DeviseWhitelist
end

class ApplicationController < ActionController::Base
  # ApplicationController is the parent controller of all other child controllers, meaning it's functions are accessible to the child controllers
  protect_from_forgery with: :exception
  # to include this module, is better practice to include a module here than put all of the logic/methods here
  include DeviseWhitelist

  before_action :set_source

  def set_source
    session[:source] = params[:q] if params[:q]
  end
  # i want you to set the session and grab the [:source](can be any word) and set it equal to whatever the params are
  # then you have access to it anywhere on the page
  # if you look at the session by calling <%= session.inspect %> and do ctrl F you can see 'source' as a key and the value, you can then call on it during the session
end

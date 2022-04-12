module SetSource
  extend ActiveSupport::Concern
  # need to put ActiveSupport (a module) to have access to certain methods like 'include'
  included do
    before_action :set_source
  end

  def set_source
    session[:source] = params[:q] if params[:q]
  end
  # i want you to set the session and grab the [:source](can be any word) and set it equal to whatever the params are
  # then you have access to it anywhere on the page
  # if you look at the session by calling <%= session.inspect %> and do ctrl F you can see 'source' as a key and the value, you can then call on it during the session
end

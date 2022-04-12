module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: "Guest User",
                  first_name: "Guest",
                  last_name: "User",
                  email: "guest@example.com")
  end
end

# other current_user is a devise method, this method will override it and be available to all models
# super says to keep the behavior of the method you are overwriting
# if current_user exist, treat like normal user and if not
# if super is false (user is not logged in), then do behaviors of guest_user (which we will always make true)
# OpenStruct allows the null object pattern, it is a gem in rails that allows you to make objects
# if a user is logged in call super(all the current_user devise logic, if not, return the Openstruct object)

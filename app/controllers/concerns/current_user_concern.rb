module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@example.com"
    guest
  end

  # def guest_user
  #   OpenStruct.new(name: "Guest User",
  #                 first_name: "Guest",
  #                 last_name: "User",
  #                 email: "guest@example.com")
  # end
  # We aren't using this because it doesn't work with the petergate authorization gem
end

# other current_user is a devise method, this method will override it and be available to all models
# super says to keep the behavior of the method you are overwriting
# if current_user exist, treat like normal user and if not
# if super is false (user is not logged in), then do behaviors of guest_user (which we will always make true)
# OpenStruct allows the null object pattern, it is a gem in rails that allows you to make objects
# if a user is logged in call super(all the current_user devise logic, if not, return the Openstruct object)

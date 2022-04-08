class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable (confirm they are the same person with their email), :lockable ( can lock someone out, say if they try logging
  # in 5x ), :timeoutable ( you can time out a user), :trackable and :omniauthable( integreate 3rd party logins from ex.Facebook or Google)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # devise automatically requires an email and password but we want it to require a name too b. we
  # will be running methods on name and if they don't put in a name will get errors

  validates_presence_of :name

  def first_name
    # self means whenever we are instantiating a specific user, we are talking about them
    # split, splits the name into an array
    # first is array method and will grab first element in array
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
end

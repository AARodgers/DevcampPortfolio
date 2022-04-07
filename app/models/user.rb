class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable (confirm they are the same person with their email), :lockable ( can lock someone out, say if they try logging
  # in 5x ), :timeoutable ( you can time out a user), :trackable and :omniauthable( integreate 3rd party logins from ex.Facebook or Google)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

module ApplicationHelper
  # you only want them to see logout button if they are already loggedin %>
  # opposed to the OpenStruct object for the is_a? which will always be true, if it is User class means they have a log in %>
  # this is ruby code so it's always is going to return last item, so it will return Login always, but if you wrap in parentheses and concatonate them with +
  # and then it is the same as if you had them on the same line
  def login_helper
    if current_user.is_a?(User)
      link_to "Logout", destroy_user_session_path, method: :delete
    else
      (link_to "Register", new_user_registration_path) +
      "<br>".html_safe + # need or else Sign Up and Login will be on same line
      (link_to "Login", new_user_session_path)
    end
  end
end

# .html_safe: makes sure malicious code isn't entered into your database, it 'cleans' the code before
# rendering it to html, should use it when your dealing with content you have written or own, not when
# it is user input

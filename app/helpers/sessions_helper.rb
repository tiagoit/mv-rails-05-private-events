module SessionsHelper
  # this method is used to set a session in the browser's cookies
  def log_in_helper(user)
    session[:user_id] = user.id
  end

  # this method is used to retrieve the actual user on the session
  def current_user_helper
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # this method is used to destroy the actual user's session
  def log_out_helper
    session.delete(:user_id)
    @current_user = nil
  end

  # this method is used to validate if a user is logged
  def logged_in_helper?
    !current_user_helper.nil?
  end
end

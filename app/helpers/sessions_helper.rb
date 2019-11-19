module SessionsHelper
  # this method is used to set a session in the browser's cookies
  def log_in_helper(user)
    session[:user_id] = user.id
  end

  # this method is used to retrieve the actual user on the session
  def current_user_helper
    @current_user ||= User.find_by(id: session[:id]) if session[:user_id]
  end
  
  # this method is used to destroy the actual user's session
  def log_out_helper
    session.delete(:user_id)
    @current_user = nil
  end
end

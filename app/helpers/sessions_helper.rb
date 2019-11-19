module SessionsHelper
  def log_in_helper(user)
    session[:user_id] = user.id
  end

  def current_user_helper
    @current_user ||= User.find_by(id: session[:id]) if session[:user_id]
  end
  
  def log_out_helper
    session.delete(:user_id)
    @current_user = nil
  end
end

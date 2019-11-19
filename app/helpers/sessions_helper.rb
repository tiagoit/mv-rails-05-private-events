module SessionsHelper
  def log_in_helper(user)
    session[:user_id] = user.id
  end
end

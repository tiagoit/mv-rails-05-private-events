class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user
      log_in_helper(@user)
    else
      flash.now[:danger] = 'Invalid email'
      render 'new'
    end
  end

  def destroy
    log_out_helper if logged_in_helper?
  end
end

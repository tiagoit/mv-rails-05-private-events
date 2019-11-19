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
  
  end
end

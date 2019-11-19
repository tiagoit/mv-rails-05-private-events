class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in_helper(@user)
      flash[:success] = 'Your account was created'
      redirect_to user_path @user
      # TODO: continue here
    end
  end

  def show; end

  ################################################### private ##########################################################
  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create; end

  def show; end

  ################################################### private ##########################################################
  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

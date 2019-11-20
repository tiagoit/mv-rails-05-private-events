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
    else
      flash[:danger] = 'Please try again.'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @my_events = Event.where(user_id: @user.id).paginate(page: params[:page])
    @previous = Event.joins(:attendees).previous_events.where('attendees.user_id = ?', current_user_helper.id).paginate(page: params[:page])
    @next = Event.joins(:attendees).next_events.where('attendees.user_id = ?', current_user_helper.id).paginate(page: params[:page])
    # debugger
  end

  ################################################### private ##########################################################
  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

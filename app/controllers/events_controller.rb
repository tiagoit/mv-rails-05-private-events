class EventsController < ApplicationController

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:success] = 'Your event was created'
      redirect_to root_path @event
    else
      flash[:danger] = 'Please try again.'
      redirect_to root_path
    end
  end

  def attendee
    @event = Event.find_by(id: params[:event_id])
    @users = User.all
    @attendees = Attendee.where(event_id: params[:event_id])
  end

  def attendance
    attendee = Attendee.new(user_id: params['user_id'], event_id: params['event_id'])

    if attendee.save
      flash[:success] = 'User added to event'
    else
      flash[:danger] = 'Try again'
    end

    redirect_to attendee_path(event_id: params['event_id'])
  end

  ################################################### private ##########################################################
  private

  def event_params
    params.require(:event).permit(:description, :location, :date, :user_id)
  end
end

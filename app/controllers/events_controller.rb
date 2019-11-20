class EventsController < ApplicationController
  def index
    @events = Event.paginate(page: params[:page])
  end

  def new
    @event = Event.new
  end

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
    debugger
    atendee = Attendee.new(user_id: params['user_id'], event_id: params['event_id'])
    if atendee.save
      flash.now[:success] = 'User added to event'
      redirect_to attendee_path(event_id: params['event_id'])
    else
      flash.now[:danger] = 'Try again'
      redirect_to attendee_path(event_id: params['event_id'])
    end
  end

  ################################################### private ##########################################################
  private

  def event_params
    params.require(:event).permit(:description, :location, :date, :user_id)
  end
end

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

  ################################################### private ##########################################################
  private

  def event_params
    params.require(:event).permit(:description, :location, :date, :user_id)
  end
end

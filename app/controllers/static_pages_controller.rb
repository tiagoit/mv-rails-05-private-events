class StaticPagesController < ApplicationController
  def index
    return unless logged_in_helper?

    @event = current_user_helper.events.build
    @events = Event.paginate(page: params[:page])
    @previous = Event.previous_events.paginate(page: params[:page])
    @next = Event.next_events.paginate(page: params[:page])
  end
end

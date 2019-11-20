class StaticPagesController < ApplicationController
  def home
    return unless logged_in_helper?

    @event = current_user_helper.events.build
    @events = Event.paginate(page: params[:page])
    @previous = Event.joins(:attendees).previous_events
    @next = Event.joins(:attendees).next_events
  end
end

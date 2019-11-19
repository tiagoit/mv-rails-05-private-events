class StaticPagesController < ApplicationController
  def home
    return unless logged_in?

    @events = current_user.events.paginate(page: params[:page])
  end
end

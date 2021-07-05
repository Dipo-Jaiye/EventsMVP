class WelcomeController < ApplicationController
  def index
    @current_user
  end

  def events
    @events = Event.where(visible: 'everybody', event_status: 'ready').order(created_at: :desc)
  end

  def signin
  end
end

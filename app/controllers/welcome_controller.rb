class WelcomeController < ApplicationController
  def index
  end

  def events
    @events = Event.where(visible: 'everybody', event_status: 'ready').order(created_at: :desc)
  end
end

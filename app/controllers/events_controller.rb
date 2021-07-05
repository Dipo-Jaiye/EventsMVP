class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def create
        @user = User.find(params[:user_id])
        @event = @user.events.new(event_params)

        if @event.save
            redirect_to @user
        else
            render :new
        end
    end

    def new
        @user = User.find(params[:user_id])
        @event = @user.events.new
    end

    def edit
        @user = User.find(params[:user_id])
        @event = @user.events.find(params[:id])
    end

    def show
        @user = User.find(params[:user_id])
        @event = @user.events.find(params[:id])
    end

    def update
        @user = User.find(params[:user_id])
        @event = @user.events.find(params[:id])

        if @event.update(event_params)
            redirect_to user_event_path(@user,@event)
        else
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:user_id])
        @event = @user.events.find(params[:id])
        @event.destroy

        redirect_to user_path(@user)
    end

    private
    def event_params
        params.require(:event).permit(:title,:description, :pay_status,
        :from, :to, :event_status, :visible, :location)
    end
end

class UserSessionsController < ApplicationController
    before_action :require_no_user, :only => [:new, :create]
    before_action :require_user, :only => :destroy
    def new
        @user_session = UserSession.new
      end
    
    def create
        @user_session = UserSession.new(user_session_params.to_h)
        if @user_session.save
            flash[:notice] = "Login successful!"
            redirect_to user_path(@user_session.user)
        else
            render :action => :new
        end
    end
    
    def destroy
        current_user_session.destroy
        flash[:notice] = "Logout successful!"
        redirect_to root_path
    end

    private

    def user_session_params
        params.require(:user_session).permit(:email, :password, :remember_me)
    end
end

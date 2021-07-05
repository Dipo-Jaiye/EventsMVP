class UsersController < ApplicationController
    before_action :require_no_user, :only => [:new, :create]
    before_action :require_user, :only => [:edit, :show, :update, :destroy]

    def create
        @user = User.new(user_params)

        if @user.save
            flash[:success] = "Account registered!"
            redirect_to @user
        else
            render :new
        end
    end

    def new
        @user = User.new
    end

    def edit
        @user = @current_user
    end

    def show
        @user = @current_user
    end

    def update
        @user = @current_user

        if @user.update(user_params)
            flash[:notice] = "Update successful!"
            redirect_to @user
        else
            render :edit
        end
    end

    def destroy
        @user = @current_user
        @user.destroy

        redirect_to root_path
    end

    private
    def user_params
        params.require(:user).permit(:name,:email, :phone, :password, :password_confirmation)
    end

end

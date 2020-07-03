class UsersController < ApplicationController

    skip_before_action :require_login, only: [:new, :create]

    def new 
        @user = User.new 
        @foot="nofoot"
    end 

    def create 
        @user = User.new(user_params) 
        if @user.valid? 
            @user.save 
            redirect_to '/login' 
        else 
            flash[:message] = @user.errors.full_messages 
            redirect_to '/signup' 
        end 
    end 

    def details 
        @user = User.find(session[:user_id])
    end 

    private 

    def user_params 
        params.require(:user).permit(:name, :email, :password, :password_confirmation) 
    end 

end
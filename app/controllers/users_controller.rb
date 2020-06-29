class UsersController < ApplicationController

    def new 
        @user = User.new 
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


    private 

    def user_params 
        params.require(:user).permit(:name, :email, :password, :password_confirmation) 
    end 

end
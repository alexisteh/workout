class SessionsController < ApplicationController

    skip_before_action :require_login, only: [:new, :create]

    def home 
        #home page of application 
        if session[:user_id] == nil 
            return redirect_to '/login'
        end 
        @user = User.find(session[:user_id]) 
        @gym = Gym.new 
        @site="home" 
        
    end 

    def logbook 
        @user = User.find(session[:user_id]) 
        @site = "logbook" 
    end 

    def new 
        #go to form to log in with name, password
        @user = User.new 
        @foot = "nofoot"
    end 

    def create 
        #from post action on login page 
        #checks if credentials are rights, if so, sends to home 
        @user = User.find_by(name: params[:user][:name]) 
        if @user == nil 
            flash[:message] = "We have no users of that name!"
            redirect_to '/login' 
        elsif @user.authenticate(params[:user][:password]) 
            session[:user_id] = @user.id 
            redirect_to '/home' 
        else 
            flash[:message] = "You might want to check that password again!"
            redirect_to '/login' 
        end 
    end 

    def destroy 
        #from post action to logging out 
        session.delete :user_id 
        redirect_to '/login' 
    end 
end 
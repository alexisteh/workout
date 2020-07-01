class SeshesController < ApplicationController

    def new 
        @sesh = Sesh.new  
        @gyms = Gym.all 
        @user = User.find(session[:user_id]) 
        @workouts = @user.applicable_workouts  
        @site="new_sesh" 
    end 

    def create 
        @sesh = Sesh.new(sesh_params) 
        @sesh.user_id = session[:user_id] 
        if @sesh.valid?  
            @sesh.save 
            @sesh.set_workout_order
            redirect_to '/home' 
        else 
            flash[:message] = @sesh.errors.full_messages 
            redirect_to '/seshes/new' 
        end 
    end 

    def edit 
        @sesh = Sesh.find(params[:id]) 
        @gyms = Gym.all 
        @user = User.find(session[:user_id]) 
        @workouts = @user.applicable_workouts  
    end 

    def update 
        @sesh = Sesh.find(params[:sesh][:id]) 
        @sesh.update(sesh_params) 
        if @sesh.valid?  
            @sesh.save 
            redirect_to '/home' 
        else 
            flash[:message] = @sesh.errors.full_messages 
            redirect_to "/seshes/#{params[:id]}/edit" 
        end 
    end 

    def delete 
        @sesh = Sesh.find(params[:id]) 
        @sesh.destroy 
        redirect_to '/home' 
    end 

    private 

    def sesh_params 
        params.require(:sesh).permit(:time, :goals, :gym_id, workout_ids: [])
    end 
end 
class SeshesController < ApplicationController

    def new 
        @sesh = Sesh.new 
        @gyms = Gym.all 
        @workouts = Workout.all 
    end 

    def create 
        @sesh = Sesh.new(sesh_params) 
        @sesh.user_id = session[:user_id] 
        if @sesh.valid?  
            @sesh.save 
            redirect_to '/home' 
        else 
            flash[:message] = @sesh.errors.full_messages 
            redirect_to '/seshes/new' 
        end 
    end 

    private 

    def sesh_params 
        params.require(:sesh).permit(:time, :goals, :gym_id, workout_ids: [])
    end 
end 
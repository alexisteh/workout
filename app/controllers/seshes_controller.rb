class SeshesController < ApplicationController

    def new
        @sesh = Sesh.new
        @workouts = Workout.all
        @gyms = Gym.all
    end

    def create
        # byebug
        sesh = Sesh.new(sesh_params)

        # TODO: Fix time not being aved into new sesh
        # TODO: Assign this sesh to the current user
        if sesh.valid? 
            sesh.save 
            redirect_to '/home'
        else 
            byebug
            flash[:message] = sesh.errors.full_messages
            puts "😭😭😭😭😭"
            redirect_to '/seshes/new' 
        end 
    end

    private

    def sesh_params
        params.require(:sesh).permit(:time, :goals, :gym_id, workout_ids: [])
    end
end 
class WorkoutsController < ApplicationController

    def new 
        @workout = Workout.new 
        @exercises = Exercise.all 
    end 

    def create 
        @workout = Workout.new(workout_params)
        if @workout.valid? 
            @workout.save 
            redirect_to '/home'
        else 
            flash[:message] = @workout.errors.full_messages
            redirect_to '/workouts/new' 
        end 
    end 

    private 
    def workout_params
        params.require(:workout).permit(:name, :description, exercise_ids: [])
    end 

end 
class WorkoutexercisesController < ApplicationController

    # TODO: Link workouts to this workout exercise
    def show
        # byebug
        @workout = Workout.find(params[:id])
        @workoutexercises = Workout.find(params[:id]).workoutexercises 
    end

    def edit 
        if Workoutexercise.find(params[:id]).workout.user_id == User.first.id 
            redirect_to '/home' 
        end 
        # byebug
        @workoutexercise = Workoutexercise.find(params[:id]) 
    end 

    def update 
        # byebug
        workoutexercise = Workoutexercise.find(params[:workoutexercise][:id])  
        workoutexercise.update(workoutexercise_params)  
        
        if workoutexercise.valid? 
            workoutexercise.save 
            redirect_to "/workoutexercises/#{workoutexercise.workout.id}" 
        else 
            flash[:message] = workoutexercise.errors.full_messages 
            redirect_to edit_workoutexercise_path(id: params[:id]) 
        end  
    end 

    private

    def workoutexercise_params 
        params.require(:workoutexercise).permit(:reps, :sets, :duration)
    end 
    
end

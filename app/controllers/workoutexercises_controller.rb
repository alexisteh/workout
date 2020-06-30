class WorkoutexercisesController < ActionController::Base

    # TODO: Link workouts to this workout exercise
    def show
        # byebug
        @workoutexercises = Workout.find(params[:id]).workoutexercises
        
    end

    def edit 
        @workoutexercise = Workoutexercise.find(params[:id]) 
    end 

    def update 
        @workoutexercise = Workoutexercise.find(params[:workoutexercise][:id])  
        @workoutexercise.update(workoutexercise_params)  
        if @workoutexercise.valid? 
            @workoutexercise.save 
            redirect_to '/workouts'
        else 
            flash[:message] = @workoutexercise.errors.full_messages 
            redirect_to edit_workoutexercise_path(id: params[:id]) 
        end  
    end 

    def delete 
        @workoutexercise = workoutexercise.find(params[:id]) 
        @workoutexercise.destroy 
        redirect_to '/home'
    end 

    def workoutexercise_params 
        params.require(:workoutexercise).permit(:reps, :sets, :duration)
    end 
    
end

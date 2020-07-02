class WorkoutsController < ApplicationController

    def new 
        @workout = Workout.new 
        @exercises = Exercise.all
        @site = "new_workout"
    end 

    def create 
        @workout = Workout.new(workout_someparams)
        @workout.update(user_id: session[:user_id]) 
        unless @workout.valid? 
            flash[:message] = @workout.errors.full_messages 
            return redirect_to '/workouts/new' 
        end 
        @workout.save 
        if @workout.make_joiner(workoutexercise_params) == "worked"  
            if @workout.exercises == [] 
                flash[:message] = ["Workouts need at least one exercise!"]
                @workout.destroy 
                return redirect_to '/workouts/new' 
            else 
                @workout.save 
                return redirect_to '/workouts' 
            end 
        else 
            flash[:message] = @workout.make_joiner(workoutexercise_params) 
            @workout.destroy 
            return redirect_to '/workouts/new' 
        end 
    end 

    def index
        @site="manage_workouts"
        @pub_workouts = Workout.select{|workout| workout.user_id == User.first.id} 
        @priv_workouts = Workout.select{|workout| workout.user_id == session[:user_id] }
    end 

    def delete 
        @workout = Workout.find(params[:id]) 
        @workout.sessionworkouts.destroy_all 
        @workout.workoutexercises.destroy_all 
        @workout.destroy 
        redirect_to '/workouts' 
    end 


    private 

    def workout_someparams
        params.require(:workout).permit(:name, :description)  
    end 

    def workoutexercise_params
        params.require(:workout).permit(workoutexercises_attributes: [:exercise_id, :reps, :sets, :duration])  
    end 

end 
class ExercisesController < ApplicationController

    def index 
        @pub_exercises = Exercise.all.select{|exercise| exercise.user.id == User.first.id} 
        @priv_exercises = Exercise.all.select{|exercise| exercise.user_id == session[:user_id]} 
        @exercise = Exercise.new 
    end 

    def create
        @exercise = Exercise.new(exercise_params) 
        @exercise.update(user_id: session[:user_id]) 
        if @exercise.valid? 
            @exercise.save 
            redirect_to '/exercises' 
        else 
            flash[:message] = @exercises.errors.full_messages 
            redirect_to '/exercises'
        end 
    end 

    private 

    def exercise_params 
        params.require(:exercise).permit(:name, :category) 
    end  
end 
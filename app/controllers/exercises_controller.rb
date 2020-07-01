class ExercisesController < ApplicationController

    def index 
        @pub_exercises = Exercise.all.select{|exercise| exercise.user.id == User.first.id} 
        @priv_exercises = Exercise.all.select{|exercise| exercise.user_id == session[:user_id]} 
        @exercise = Exercise.new 
        @site = "manage_exercises"
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

    def delete 
        @ex = Exercise.find(params[:id]) 
        @ex.destroy 
        redirect_to '/exercises' 
    end 

    def edit 
        @exercise = Exercise.find(params[:id])
    end 

    def update
        @exercise = Exercise.find(params[:exercise][:id])
        @exercise.update(exercise_params)
        if @exercise.valid?
            @exercise.save
            redirect_to '/exercises'
        else 
            flash[:message] = @exercise.errors.full_messages
        end 
    end 

    private 

    def exercise_params 
        params.require(:exercise).permit(:name, :category) 
    end  
end 
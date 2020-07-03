class ExercisesController < ApplicationController

    def index 
        @pub_exercises = Exercise.all.select{|exercise| exercise.user.id == User.first.id} 
        @priv_exercises = Exercise.all.select{|exercise| exercise.user_id == session[:user_id]} 
        @exercise = Exercise.new 
        @exercisecats = Exercisecat.all
        @site = "manage_exercises"
    end 

    def create
        @exercise = Exercise.new 
        @exercise.user_id = session[:user_id] 
        @exercise.update(name: exercise_params[:name]) 
        if exercise_params[:exercisecat_id] == "" 
            if exercise_params[:exercisecat] == ""
                flash[:message] = ["Exercise needs a category"]
                return redirect_to '/exercises'
            else 
                newex = Exercisecat.find_or_create_by(name: exercise_params[:exercisecat]) 
                @exercise.update(exercisecat_id: newex.id) 
            end 
        else
            @exercise.update(exercisecat_id: exercise_params[:exercisecat_id])  
        end 
        if @exercise.valid? 
            @exercise.save 
            return redirect_to '/exercises' 
        else 
            flash[:message] = @exercise.errors.full_messages 
            redirect_to '/exercises'
        end 
    end 

    def delete 
        @ex = Exercise.find(params[:id]) 
        @ex.workoutexercises.destroy_all 
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
        params.require(:exercise).permit(:name, :exercisecat_id, :exercisecat) 
    end  
end 
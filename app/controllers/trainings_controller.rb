class TrainingsController < ApplicationController

    def new 
        @training = Training.new 
        @exercises = Exercise.all 
    end 

    def create 
        @training = Training.new(training_params)
        if @training.valid? 
            @training.save 
            redirect_to '/home'
        else 
            flash[:message] = @training.errors.full_messages
            redirect_to '/trainings/new' 
        end 
    end 

    private 
    def training_params
        params.require(:training).permit(:name, :description, exercise_ids: [])
    end 

end 
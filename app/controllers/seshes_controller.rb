class SeshesController < ApplicationController

    def new 
        @sesh = Sesh.new  
        @gyms = Gym.select{|gym| gym.user.id == session[:user_id]}
        @user = User.find(session[:user_id]) 
        @workouts = @user.applicable_workouts  
        @site="new_sesh" 
    end 

    def create 
        @sesh = Sesh.new(sesh_params) 
        @sesh.user_id = session[:user_id] 
        if @sesh.valid?  
            @sesh.save 
            @sesh.set_workout_order
            redirect_to '/home' 
        else 
            flash[:message] = @sesh.errors.full_messages 
            redirect_to '/seshes/new' 
        end 
    end 

    def edit 
        @sesh = Sesh.find(params[:id]) 
        @gyms = Gym.select{|gym| gym.user.id == session[:user_id]}
        @user = User.find(session[:user_id]) 
        @workouts = @user.applicable_workouts  
    end 

    def update 
        @sesh = Sesh.find(params[:sesh][:id]) 
        @sesh.update(sesh_params) 
        if @sesh.valid?  
            @sesh.save 
            redirect_to '/home' 
        else 
            flash[:message] = @sesh.errors.full_messages 
            redirect_to "/seshes/#{params[:id]}/edit" 
        end 
    end 

    def delete_home
        @sesh = Sesh.find(params[:id]) 
        @sesh.sessionworkouts.destroy_all 
        @sesh.destroy 
        redirect_to '/home' 
    end 

    def delete_log
        @sesh = Sesh.find(params[:id]) 
        @sesh.sessionworkouts.destroy_all 
        @sesh.destroy 
        redirect_to '/logbook' 
    end 

    def activate 
        @sesh = Sesh.find(params[:id]) 
        @user = User.find(session[:user_id]) 
    
        # List of session workouts that have NOT been activated
        seshworkouts = @sesh.sessionworkouts.select{|sesh_wkt| !sesh_wkt.activated}
        
        # redirect to home  if there are no more non activated seshworkouts
        if(seshworkouts.length == 0 )
            # Reset activation of workoutexercises so that they can be used in another session
            Workoutexercise.all.each{|we| we.update_attribute(:activated, false)}
            redirect_to '/home'
        # Fail-safe to stop error with current_exercise being null
        elsif (seshworkouts.first.workout.workoutexercises.select{|wkt_exc| !wkt_exc.activated}.length == 0)
            redirect_to '/home'
        else
            @current_workout = seshworkouts.first.workout

            # List of Workoutexercises that have NOT been activated
            workout_exercises = @current_workout.workoutexercises.select{|wkt_exc| !wkt_exc.activated}
            
            @current_exercise = workout_exercises.first.exercise
                
            # activate exercise
            workout_exercises.find{|wkt_exc|wkt_exc.exercise_id == @current_exercise.id}.update_attribute(:activated, true)
            # activate workout if there are no more exercises that have not been activated
            if (@current_workout.workoutexercises.select{|wkt_exc| !wkt_exc.activated}.length == 0)
                seshworkouts.find{|ses_wkt| ses_wkt.workout_id == @current_workout.id}.update_attribute(:activated, true)
            end
            
            @minutes = workout_exercises.find{|wkt_exc|wkt_exc.exercise_id == @current_exercise.id}.duration
        end
    end 

    private 

    def sesh_params 
        params.require(:sesh).permit(:time, :goals, :gym_id, workout_ids: [])
    end 
end 
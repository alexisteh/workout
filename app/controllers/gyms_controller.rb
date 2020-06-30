class GymsController < ApplicationController

    def create 
        @gym = Gym.new(gym_params) 
        @gym.user_id = session[:user_id] 
        if @gym.valid? 
            @gym.save 
            redirect_to '/home'
        else 
            flash[:message] = @gym.errors.full_messages 
            redirect_to '/home' 
        end 
    end 

    def gym_params 
        params.require(:gym).permit(:name, :address, :list_of_equipment)
    end 
end 
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

    def edit 
        @gym = Gym.find(params[:id]) 
    end 

    def update 
        @gym = Gym.find(params[:gym][:id])  
        @gym.update(gym_params)  
        if @gym.valid? 
            @gym.save 
            redirect_to '/home'
        else 
            flash[:message] = @gym.errors.full_messages 
            redirect_to edit_gym_path(id: params[:id]) 
        end  
    end 

    def delete 
        @gym = Gym.find(params[:id]) 
        @gym.seshes.each do |sesh| 
            sesh.update(gym_id: nil) 
            sesh.save 
        end 
        @gym.destroy 
        redirect_to '/home'
    end 

    def gym_params 
        params.require(:gym).permit(:name, :address, :list_of_equipment)
    end 
end 
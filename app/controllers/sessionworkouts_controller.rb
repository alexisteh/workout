class SessionworkoutsController < ApplicationController

    def update
        redirect_to '/home'
        byebug
    end

    private 

    def sessionworkout_params 
        params.require(:sessionconller).permit(:count []) 
    end 

end
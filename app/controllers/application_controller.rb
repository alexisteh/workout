class ApplicationController < ActionController::Base
    before_action :require_login 
    helper_method :require_login 


    private
 
    def require_login
      if session[:user_id] == nil 
        flash[:error] = "You must be logged in to access this section"
        redirect_to '/login' 
      end 
    end

end

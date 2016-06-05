class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :null_session

    def require_login
    	if session[:email]
    		return true
    	else

    		return false
    	end
    end

    def require_login_as_admin
      if require_login
    		if session[:user_type] && session[:user_type] == "admin"
  			    return true
        else
    			  redirect_to :controller => "home"  			
    			  return false
    		end
    	else
      		redirect_to :controller => "home"  		
      		return false	
    	end
    end

    def require_login_as_chef
      if require_login
        if session[:user_type] && session[:user_type] == "chef"
            return true
        else
            redirect_to :controller => "home"       
            return false
        end
      else
          redirect_to :controller => "home"     
          return false  
      end
    end

    def clearCart
        session[:dishes] = nil
        session[:cart_size] = nil
    end

end

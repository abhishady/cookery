class LoginController < ApplicationController

	
	def authenticateUser
		email = params[:user][:email]
		password = params[:user][:password]
		@user = User.authenticate(email,password)
		if @user
			session[:email] = @user.email
			session[:id] = @user.id
			session[:name] = @user.name
			session[:user_type] = (@user.is_admin == true ? "admin" : (@user.is_staff == true ? "chef" : "public"))
			if session[:user_type] == "admin"
				redirect_to :controller => "admin"
			elsif session[:user_type] == "chef"
				redirect_to :controller => "chef"
			else
				if session[:current_page]=="home"
					redirect_to :controller => "home"
				elsif session[:current_page]=="dishes"
					redirect_to :controller => "dishes"
				elsif session[:current_page]=="recipes"
					redirect_to :controller => "dish", :action=>"dishDetail" , :id=> session[:dish_id]
				end	
			end
		else
			flash[:notice] = "Invalid Email or Password!!"
			if session[:current_page]=="home"
					redirect_to :controller => "home"
				elsif session[:current_page]=="dishes"
					redirect_to :controller => "dishes"
				elsif session[:current_page]=="recipes"
					redirect_to :controller => "dish", :action=>"dishDetail" , :id=> session[:dish_id]
			end	
		end
	end

	def signup
		@user = User.new(user_params)
	    if @user.valid?
	    	@user.save
	        if session[:current_page]=="home"
					redirect_to :controller => "home"
				elsif session[:current_page]=="dishes"
					redirect_to :controller => "dishes"
				elsif session[:current_page]=="recipes"
					redirect_to :controller => "dish", :action=>"dishDetail" , :id=> session[:dish_id]
			end	
	    else
	        if session[:current_page]=="home"
					redirect_to :controller => "home"
				elsif session[:current_page]=="dishes"
					redirect_to :controller => "dishes"
				elsif session[:current_page]=="recipes"
					redirect_to :controller => "dish", :action=>"dishDetail" , :id=> session[:dish_id]
			end	
	    end 
	end

	def logout
		if session[:email]
			session[:email] = nil
			session[:name] = nil
			session[:id] = nil
			session[:user_type] = nil
			flash[:notice] = "Logout Successfully"
			if session[:current_page]=="home"
					redirect_to :controller => "home"
				elsif session[:current_page]=="dishes"
					redirect_to :controller => "dishes"
				elsif session[:current_page]=="recipes"
					redirect_to :controller => "dish",:action=>"dishDetail",:id=> session[:dish_id]
			end	
		end
	end
	def user_params
      	params.require(:user).permit(:name,:email,:password,:is_admin,:is_active,:is_staff)
   	end
end
    
class DishController < ApplicationController
  	layout "admin"
   	# before_filter :require_login_as_admin
    include ApplicationHelper
    before_filter :cart
    def new
    	
    end
    def allDish
        session[:current_page] = "dishes"
        if params[:srch]
          search = params[:srch]
            @dishes = Dish.where("dish_name like ?", "%#{search}%")
        else
    		    @dishes = Dish.all().order("id DESC")
        end
    		render :layout=>'dishes'
    end

    def dishDetail
        session[:current_page] = "recipes"
        session[:dish_id] = params[:id]
    		@dish = Dish.find(params[:id]) 		
        @reviews = Review.where(dish_id: session[:dish_id]).order("id DESC")
    		render :layout=>'recipes'
    end

    def list
        @dishes = Dish.all().order("id DESC")
    end
end

class AddDishController < ApplicationController
	layout "chef"
  	before_filter :require_login_as_chef

	include ApplicationHelper
	def new
		@dish = Dish.new
	end
	def create
		dish_image = params[:dish][:dish_image]
		dish_name = upload(dish_image)
		params[:dish][:dish_image] = dish_name
		@dish = Dish.new(user_params) 
	  	if @dish.valid?
	  		@dish.save
       flash[:success] = "Dish was successfully added"
	  		render "new"
	  	else
	  		render "new"
	  	end 
	end
	def list
		@dishes = Dish.all
	end
	def edit
		@dish = Dish.find(params[:id])
	end
	def update
		dish_image = params[:dish][:dish_image]
		dish_name = upload(dish_image)
		params[:dish][:dish_image] = dish_name
		@dish = Dish.find(params[:id])
    	if @dish.update_attributes(user_params)
    		flash[:success] = "Dish was successfully updated"
      		redirect_to :action=>"list"
    	end
	end
	def delete
		@dish = Dish.find(params[:id])
  		if @dish.destroy
  			flash[:danger] = "Dish was successfully deleted"
  	  		redirect_to :action=>"list"
    	end
	end
	def user_params
		params.require(:dish).permit(:user_id,:date,:dish_name,:category_name,:method,:ingredients,:dish_image,:price)
	end
end

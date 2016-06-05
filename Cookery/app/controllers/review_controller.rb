class ReviewController < ApplicationController
	layout "chef"
  	before_filter :require_login_as_chef, :except=> [:adminReview]

	def new
		@review = Review.new
	end
	def create
	  	@review = Review.new(review_params)
	  	if @review.valid?
	  		@review.save
        flash[:success] = "Review was successfully added"
	  		render "new"
	  	else
	  		render "new"
	  	end 
  	end

  	def list
  		@dishes = Dish.where(user_id: session[:id])
  	end
  	def edit
   		@review = Review.find(params[:id])
 	end
  	def update
    	@review = Review.find(params[:id])
    	if @review.update_attributes(review_params)
    		flash[:success] = "Review was successfully updated"
      		redirect_to :action=>"list"
          
    	end
  	end
  	def delete
	  	@review  = Review.find(params[:id])
	  	flash[:danger] = "Review was successfully deleted"
	  	@review.destroy
	  	redirect_to :action => "list"
  	end

  	def adminReview
  		@reviews = Review.all
  		render :layout=>'admin'
  	end

  	def review_params
	  	params.require(:review).permit(:user_id,:dish_id,:description)
	end
end

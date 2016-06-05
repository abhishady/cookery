class HomeController < ApplicationController
	layout "home", :except=>[:reviewOrder]
	include ApplicationHelper
	before_filter :cart
	def view
		session[:current_page] = "home"
		@dish = Dish.last(5).reverse
	end

	def add
	  	if params.has_key?(:home)
	  		dish_id = params[:home][:dish_id]
	  		qty = params[:home][:quantity]
	  		hash = {dish_id=>qty}
	  		session[:dishes] = session[:dishes] ? session[:dishes].merge!(hash) : hash
	      updateCartCount
	  	end
	        redirect_to :controller=>'dishes'

  	end

	# def updateCart
	#   	if params[:home][:dish_id]
	#   		if session[:dishes]
	#   			qty = params[:home][:quantity]
	#   			id = params[:home][:dish_id]
	#   			hash = {id=>qty}
	#   			session[:dishes].update(hash)
	#   			updateCartCount
	# 	        redirect_to :controller=>"home"
	#   		else
	#   			redirect_to :controller=>"home"
	#   		end
	#   	else
	#   		flash[:notice] = "something wrong"
	#   		redirect_to :controller=>"home" 
	#   	end
	# end

  	def deleteCart
	  	if params[:id]
	  		session[:dishes].delete(params[:id])
	      	updateCartCount
	    	if session[:current_page]=="home"
					redirect_to :controller => "home"
				elsif session[:current_page]=="dishes"
					redirect_to :controller => "dishes"
				elsif session[:current_page]=="recipes"
					redirect_to :controller => "dish", :action=>"dishDetail" , :id=> session[:dish_id]
			end	  
	    end
    end

    def saveOrder
    	@om = OrderMaster.new()
	    @om.user_id = session[:id]
	    totalQty = 0
	    totalCost = 0
	    session[:dishes].each do |pid,qty|
	      totalQty+= qty.to_f
	      d = Dish.find(pid)
	      totalCost += qty.to_f * d.price.to_f
	    end
	    @om.no_of_dish = totalQty
	    @om.total_cost = totalCost
	    @om.mop = params[:mop] 
	    if @om.save
	      @@order_id = @om.id
	      saveOrderDetail
	      saveShipping
	      saveBilling
	      clearCart
	      redirect_to :action=>"reviewOrder"
	    end
    end

    def saveOrderDetail
    
	    session[:dishes].each do |pid,qty|
	      @od = OrderDetail.new()
	      d = Dish.find(pid)
	      @od.order_id = @@order_id
	      @od.dish_id = pid
	      @od.quantity = qty
	      @od.price = d.price
	      @od.row_total = qty.to_f * d.price.to_f
	      @od.save
	    end
	    return true
  	end

  	def saveShipping
	    @shipping = Shipping.new()
	    @shipping.order_id = @@order_id
	    @shipping.name = params[:sname]
	    @shipping.address = params[:saddress]
	    @shipping.contact = params[:scontact]
	    @shipping.city = params[:scity]
	    @shipping.state = params[:sstate]
	    @shipping.pincode = params[:spincode]
	    @shipping.save
  	end
  	def saveBilling
	    @billing = Billing.new()
	    @billing.order_id = @@order_id
	   	@billing.name = params[:bname]
	    @billing.address = params[:baddress]
	    @billing.contact = params[:bcontact]
	    @billing.city = params[:bcity]
	    @billing.state = params[:bstate]
	    @billing.pincode = params[:bpincode]
	    @billing.save
  	end

	def reviewOrder
    	@uname = User.find(session[:id])
    	@xyz = OrderMaster.find_by(id: @@order_id)
    	@address = Shipping.find_by(order_id: @@order_id)
    	render :layout=>"reviewOrder"
    end
    def placeOrder
    	flash[:notice]= "Your Order has been placed..Thanks!!"
    	redirect_to :controller=>"home"
    end
  	def frontReview
  	  	@review = Review.new(review_params)
	  	if @review.valid?
	  		@review.save
	  		redirect_to :controller=>"dish",:action=>'dishDetail',:id=>session[:dish_id]
	  	end 		
  	end 	

  	def review_params
	  	params.require(:review).permit(:user_id,:dish_id,:description)
	end

end

module ApplicationHelper
	@@type = ["png","jpeg","jpg","gif"]
	def checkImageType(type)
		@@type.include?(type) ? true : false 
	end	
	def upload(file)
		upload_io = file
		filename = upload_io.original_filename
		type = filename.split(".").last
		if checkImageType(type)
			fld = Time.now.to_i
			filename = "img#{fld}."+type
			File.open(Rails.root.join("public","uploads","images",filename),"wb") do |file|
				file.write(upload_io.read)
			end
			return filename
		end
	end

	def cart
		@cart =[]
	  	@qty = {}
	  	if session[:dishes]
	  		session[:dishes].each do |p,qty|
	  		id = p
	  		@qty.merge!({p => qty})
	  		@cart << Dish.find(id)
	  		end
	  	end
		updateCartCount
	end

	def updateCartCount
		if session[:dishes]
			session[:cart_size] = session[:dishes].size
		end
	end
end

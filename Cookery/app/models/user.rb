class User < ActiveRecord::Base
	has_one :UserDetail
	has_many :dishes
	has_many :reviews
	validates_presence_of :name, :email, :password
	validates_format_of :email, :uniqueness => true , :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates_length_of :password, :minimum=> 6


	def self.authenticate(email,password)
		@user = User.find_by_email(email)
		if @user && @user.password == password
			return @user 
		else
			return false
		end
	end

	# def self.confirm(cnfrm_pwd,pwd)
	# 	if pwd == cnfrm_pwd
	# 		return true
	# 	else
	# 		return false
	# 	end
	# end
end

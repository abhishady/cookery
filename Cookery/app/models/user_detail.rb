class UserDetail < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :name,:address,:contact
end
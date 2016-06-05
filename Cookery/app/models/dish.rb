class Dish < ActiveRecord::Base
	belongs_to :user
	has_many :reveiws
	validates_presence_of :category_name,:date, :dish_name,:method,:ingredients,:dish_image,:price
end

class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.integer "user_id"
    	t.string "category_name", :limit => 20
    	t.string "dish_name", :limit => 100
    	t.text "method"
    	t.text "ingredients"
    	t.string "dish_image", :limit => 30
    	t.string "dish_video", :limit => 30
      t.string "price", :limit => 20
    	t.integer "rating"
    	t.date "date"
      t.timestamps null: false
    end
    add_index("dishes","user_id")
  end
end
class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.integer "dish_id"
    	t.integer "user_id"
    	t.text "description"
    	t.timestamps "date"
      t.timestamps null: false
    end
    add_index("reviews","dish_id")
    add_index("reviews","user_id")
  end
end

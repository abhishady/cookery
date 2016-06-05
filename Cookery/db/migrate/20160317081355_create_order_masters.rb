class CreateOrderMasters < ActiveRecord::Migration
  def change
    create_table :order_masters do |t|
    	t.integer "user_id"
    	t.integer "no_of_dish"
    	t.decimal "total_cost" , :precision=>10,:scale=>2
    	t.string "mop", :limit=> 20
    	t.string "status" , :limit => 20
      t.timestamps "date"
      t.timestamps null: false
    end
    add_index("order_masters","user_id")
  end
end

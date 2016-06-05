class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
    	t.integer "order_id"
    	t.integer "dish_id"
    	t.integer "quantity"
    	t.integer "price"
    	t.integer "row_total"
      t.timestamps null: false
    end
    add_index("order_details","order_id")
    add_index("order_details","dish_id")
  end
end

class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.integer "order_id"
    	t.string "name", :limit => 20
    	t.text "address"
    	t.integer "contact"
    	t.string "city", :limit => 20
    	t.string "state", :limit => 20
    	t.integer "pincode"
      t.timestamps null: false
    end
  end
end

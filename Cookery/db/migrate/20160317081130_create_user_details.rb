class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
    	t.integer "user_id"
    	t.text "address" 
    	t.string "contact", :limit=>20
      t.timestamps null: false
    end
    add_index("user_details","user_id")
  end
end

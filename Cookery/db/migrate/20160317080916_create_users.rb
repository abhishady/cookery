class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t| 
      t.string "name", :limit => 30
    	t.string "email" , :limit => 30
    	t.string "password" , :limit => 20
    	t.boolean "is_active" , :default=> false
    	t.boolean "is_admin" , :default=> false
    	t.boolean "is_staff" , :default=> false
      t.timestamps null: false
    end
  end
end

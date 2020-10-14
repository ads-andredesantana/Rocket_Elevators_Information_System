class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table "Employee", primary_key: "User_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
      t.string "Last_Name", limit: 45, null: false
      t.string "First_Name", limit: 45, null: false
      t.string "Title_Function", limit: 45, null: false
      t.string "Email", limit: 45, null: false
    
      
      t.timestamps
    end
  end
end

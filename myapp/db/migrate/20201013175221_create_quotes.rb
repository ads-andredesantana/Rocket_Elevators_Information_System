class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
      create_table "Quotes", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do t|
      t.integer "Customerid", null: false
      t.string "First_name", limit: 45, null: false
      t.string "Last_name", limit: 45
      t.string "Building_Type", limit: 10, null: false
      t.integer "Suggested_elevators", null: false
      t.string "Style_Chosen", limit: 10, null: false
      t.integer "Install_cost", null: false
      t.integer "Total_Cost"
      t.string "Email", limit: 45, null: false

      t.timestamps
    end
  end
end

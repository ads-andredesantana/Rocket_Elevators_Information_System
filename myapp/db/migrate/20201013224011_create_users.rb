class CreateUsers < ActiveRecord::Migration[5.2]
  def change
      create_table "Users", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade d
      t.integer "id_Users", null: false, auto_increment: true
      t.string "First_Name", limit: 45, null: false
      t.string "Last_Name", limit: 45, null: false
      t.string "Email", limit: 45, null: false
      t.index ["id_Users"], name: "id_Users_UNIQUE", unique: true

      t.timestamps
    end
  end
end

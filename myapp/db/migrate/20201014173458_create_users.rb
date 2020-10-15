class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :id_User
      t.string :First_name
      t.string :Last_name
      t.string :Email

      t.timestamps
    end
  end
end

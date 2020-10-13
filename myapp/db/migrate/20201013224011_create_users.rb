class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :id_user
      t.string :first_name
      t.string :last_name
      t.string :email\q

      t.timestamps
    end
  end
end

class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.integer :user_id
      t.string :last_name
      t.string :first_name
      t.string :title_or_function
      t.string :email
      
      t.timestamps
    end
  end
end

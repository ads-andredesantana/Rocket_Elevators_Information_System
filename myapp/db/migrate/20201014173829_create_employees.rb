class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.integer :User_id
      t.string :Last_Name
      t.string :First_name
      t.string :Title_Function

      t.timestamps
    end
  end
end

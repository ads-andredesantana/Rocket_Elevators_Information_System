class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.references :users
      t.string :first_name
      t.string :last_name
      t.string :title_function

      t.timestamps
    end
  end
end

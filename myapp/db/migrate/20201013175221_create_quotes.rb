class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :Quotes do |t|
      t.integer :id
      t.string :first_name
      t.string :last_name
      t.string :building_type
      t.string :total_cost
      t.string :integer

      t.timestamps
    end
  end
end

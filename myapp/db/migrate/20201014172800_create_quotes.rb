class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.integer :formId
      t.string :First_name
      t.string :Last_name
      t.string :Building_Type
      t.integer :Suggested_elevators
      t.integer :Install_cost
      t.integer :Total_Cost

      t.timestamps
    end
  end
end

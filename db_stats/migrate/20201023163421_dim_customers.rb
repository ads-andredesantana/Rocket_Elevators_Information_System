class DimCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_customers do |t|
      t.datetime :CreationDate
      t.string :CompanyName
      t.string :ContactFullname
      t.string :ContactEmail
      t.string :NbElevator
      t.string :City

      t.timestamps
    end
  end
end

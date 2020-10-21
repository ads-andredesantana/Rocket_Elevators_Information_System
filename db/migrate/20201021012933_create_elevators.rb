class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.references :column, foreign_key: true
      t.integer :serial_number
      t.string :model
      t.string :type
      t.string :status
      t.datetime :date_of_commissioning
      t.datetime :date_of_last_inspection
      t.string :certificate_of_inspection
      t.text :information
      t.text :notes

      t.timestamps
    end
  end
end

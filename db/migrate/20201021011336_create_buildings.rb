class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.references :customer, foreign_key: true
      t.references :address, foreign_key: true
      t.string :full_name_of_building_administrator
      t.string :email_of_building_administrator
      t.integer :phone_of_building_administrator
      t.string :full_name_technical_contact
      t.string :technical_contact_email
      t.integer :technical_contact_phone

      t.timestamps
    end
  end
end

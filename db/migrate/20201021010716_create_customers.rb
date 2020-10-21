class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.references :users, foreign_key: true
      t.string :company_name
      t.references :address, foreign_key: true
      t.string :full_name_of_contact
      t.integer :company_phone
      t.string :email_of_contact
      t.string :full_name_of_service_authority
      t.integer :technical_authority_phone
      t.string :technical_authority_email

      t.timestamps
    end
  end
end

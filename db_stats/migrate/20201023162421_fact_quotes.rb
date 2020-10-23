class FactQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_quotes do |t|
      t.string :QuoteId
      t.datetime :CreationDate
      t.string :CompanyName
      t.string :Email
      t.string :NbElevator

      t.timestamps
    end
  end
end

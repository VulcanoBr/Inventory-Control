class CreateStockEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_entries do |t|
      t.date :date_invoice
      t.string :invoice
      t.references :supplier, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price
      t.date :date_entry
      t.string :description

      t.timestamps
    end
  end
end

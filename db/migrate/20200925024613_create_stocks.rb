class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.integer :minimum_quantity
      t.integer :quantity
      t.decimal :last_unit_price
      t.string :description
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end

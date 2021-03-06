class CreateStockOuts < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_outs do |t|
      t.string :order_number
      t.references :client, foreign_key: true
      t.date :date_out
      t.references :stock, null: false, foreign_key: true
      t.integer :quantity
      t.string :description

      t.timestamps
    end
  end
end

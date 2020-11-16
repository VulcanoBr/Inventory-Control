class CreateStockAdjustments < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_adjustments do |t|
      t.string :reason
      t.date :date_adjustment
      t.references :stock, null: false, foreign_key: true
      t.integer :quantity
      t.string :description

      t.timestamps
    end
  end
end

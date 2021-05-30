class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :description
      t.references :product_type, null: false, foreign_key: true
      t.references :product_composition, null: false, foreign_key: true
      t.references :product_color, null: false, foreign_key: true
      t.references :product_size, null: false, foreign_key: true

      t.timestamps
    end
  end
end

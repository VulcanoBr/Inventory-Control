class CreateProductCompositions < ActiveRecord::Migration[6.0]
  def change
    create_table :product_compositions do |t|
      t.string :description

      t.timestamps
    end
  end
end

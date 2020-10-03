class CreateProductColors < ActiveRecord::Migration[6.0]
  def change
    create_table :product_colors do |t|
      t.string :description

      t.timestamps
    end
  end
end

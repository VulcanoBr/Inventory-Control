class CreateAddressSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :address_suppliers do |t|
      t.string :street
      t.string :number
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :zip_code
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end

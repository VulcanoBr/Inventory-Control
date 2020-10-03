class CreateContactSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_suppliers do |t|
      t.string :supplier_name
      t.string :email
      t.string :telephone
      t.string :cell_phone
      t.string :description
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateContactClients < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_clients do |t|
      t.string :client_name
      t.string :email
      t.string :telephone
      t.string :cell_phone
      t.string :description
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end

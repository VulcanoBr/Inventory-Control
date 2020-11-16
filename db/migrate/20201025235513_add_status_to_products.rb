class AddStatusToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :status, :string
  end
end

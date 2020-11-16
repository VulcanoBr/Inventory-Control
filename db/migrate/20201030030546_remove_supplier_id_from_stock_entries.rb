class RemoveSupplierIdFromStockEntries < ActiveRecord::Migration[6.0]
  def change
    remove_column :stock_entries, :supplier_id, :bigint
  end
end

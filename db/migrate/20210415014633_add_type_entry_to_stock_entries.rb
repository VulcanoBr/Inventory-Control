class AddTypeEntryToStockEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :stock_entries, :type_entry, :string
  end
end

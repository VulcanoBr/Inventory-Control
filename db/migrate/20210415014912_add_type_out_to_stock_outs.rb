class AddTypeOutToStockOuts < ActiveRecord::Migration[6.0]
  def change
    add_column :stock_outs, :type_out, :string
  end
end

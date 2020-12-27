class StockOut < ApplicationRecord
  belongs_to :client
  belongs_to :stock

  before_validation :update_quantity

  private

  def update_quantity 
 #   @stock = Stock.find_by(@stock_id)
    if quantity > 0
      @old_quantity = stock.quantity
      new_quantity = stock.quantity - quantity
    
      stock.update(quantity: new_quantity)
    else
      errors.add(quantity.to_s, ", Quantidade Nâo Pode ser negativa")
    
    end
  end
end

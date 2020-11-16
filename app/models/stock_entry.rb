class StockEntry < ApplicationRecord
 
  belongs_to :stock
  #belongs_to :product
  #belongs_to :supplier

  
  before_validation :update_quantity

  private

  def update_quantity 
 #   @stock = Stock.find_by(@stock_id)
    if quantity > 0
      @old_quantity = stock.quantity
      new_quantity = stock.quantity + quantity
      x = (unit_price).to_s
      x.sub(',','.')
      new_price = x.to_f
     

      stock.update(quantity: new_quantity, last_unit_price: new_price)
    else
      errors.add(quantity.to_s, ", Quantidade Nâo Pode ser negativa")
    
    end
  end

end

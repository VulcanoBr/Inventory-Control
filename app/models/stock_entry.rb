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
   
      new_price = unit_price
    
      stock.update(quantity: new_quantity, last_unit_price: new_price)
    else
      errors.add(quantity.to_s, ", Quantidade Nâo Pode ser negativa")
      errors.add(x.to_s, ", valor")
    end
  end

  def valor=(unit_price)
    write_attribute(:unit_price, unit_price.tr(',.', '').to_f/100)
  end

end

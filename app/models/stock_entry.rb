class StockEntry < ApplicationRecord
 
  belongs_to :stock
 
  validates :date_entry, :date_invoice, presence: true
  
 # after_validation :update_quantity

  private

  def update_quantity 
    # @stock = Stock.find_by(@stock_id)
    if (quantity.blank?)
      errors.add(:quantity.to_s, ", Quantidade Nâo foi preenchida")
    else 
        if quantity > 0
            new_quantity = stock.quantity + quantity
            new_price = unit_price 
         #   stock.update(quantity: new_quantity, last_unit_price: new_price)
        else
          errors.add(:quantity.to_s, ", Quantidade Nâo Pode ser menor que 1")
        end
    end
  end
end

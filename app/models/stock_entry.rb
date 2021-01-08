class StockEntry < ApplicationRecord
 
  belongs_to :stock
  #belongs_to :product
  #belongs_to :supplier

  validates :date_entry, :date_invoice, :stock_id, presence: true
  
  before_validation :update_quantity

  private

  def update_quantity 
 #   @stock = Stock.find_by(@stock_id)
    if (quantity.blank?)
      errors.add(:quantity.to_s, ", Quantidade Nâo foi preenchida")
    else 
      if !stock.present?
        #errors.add(:product.to_s, ", Produto Nâo foi selecionado")
        return
      else
        if quantity > 0
        # @old_quantity = stock.quantity
          new_quantity = stock.quantity + quantity
      
          new_price = unit_price
        
          stock.update(quantity: new_quantity, last_unit_price: new_price)
        else
          errors.add(:quantity.to_s, ", Quantidade Nâo Pode ser negativa")
          
        end
      end
    end
  end
end

class StockOut < ApplicationRecord
  belongs_to :client
  belongs_to :stock

  validates :date_out, :client_id, presence: true

  before_validation :update_quantity

  private

  def update_quantity 
    if (quantity.blank?)
      errors.add(:quantity.to_s, ", Quantidade Nâo foi preenchida")
    else 
        if quantity > 0
            new_quantity = stock.quantity - quantity
            stock.update(quantity: new_quantity, last_unit_price: new_price)
        else
          errors.add(:quantity.to_s, ", Quantidade Nâo Pode ser menor que 1")
        end
    end
  end
end

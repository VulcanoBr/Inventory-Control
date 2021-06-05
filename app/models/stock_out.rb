class StockOut < ApplicationRecord

  belongs_to :client, optional: true
  belongs_to :stock

  validates :date_out, :type_out, presence: true
  validates :client_id, presence: true, if: :type_out_client?

  before_validation :check_quantity

  after_create :update_quantity

  after_destroy :change_quantity

  private

  def type_out_client?
    type_out > "2"
  end

  def check_quantity
    @qtd = stock.quantity
    if (quantity.blank?)
      errors.add(:quantity.to_s, ", Quantidade Nâo foi preenchida")
    else 
        if  quantity  >  stock.quantity
          
            errors.add("Quantidade #{quantity.to_s} informada, ",  "Nâo Pode ser Maior  que #{stock.quantity} ")
        else
            if quantity < 1
                errors.add(:quantity.to_s, ", Quantidade Nâo Pode ser menor que 1")
            end
        end
    end
  end

  def update_quantity 
      new_quantity = stock.quantity - quantity
      stock.update(quantity: new_quantity)
  end

  def change_quantity
    new_quantity = stock.quantity + quantity
    stock.update(quantity: new_quantity)
  end

end

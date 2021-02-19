class Stock < ApplicationRecord
  
  belongs_to :product
  
  
  # validates :product_id, presence: true, uniqueness: true

  attribute :minimum_quantity,  default: 0

  attribute :quantity, default: 0

  attribute :last_unit_price, default: 0.00

  validate :verificanegativo

  def self.search_stock(id)
      where(product_id: id)
      
  end
  

  
  private

  def verificanegativo
    if (minimum_quantity.to_i < 0)  
      errors.add(minimum_quantity, "Quantidade Minima,  não pode ser negativa   !!!  ") 
    end
    if (quantity.to_i < 0)  
      errors.add(quantity, "Quantidade Atual,  não pode ser negativa   !!!  ") 
    end
  end

end

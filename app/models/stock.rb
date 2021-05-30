class Stock < ApplicationRecord
  
  belongs_to :product
  belongs_to :supplier

  attribute :minimum_quantity,  default: 0

  attribute :quantity, default: 0

  attribute :last_unit_price, default: 0.00

  validates :product_id, uniqueness: {
        scope: [:supplier_id, :reference],
        case_sensitive: false, message: " já existe no Estoque"
  }

  validate :verificanegativo

  scope :with_minimum_quantity, -> { where("quantity <= minimum_quantity") }

  def self.search_stock(cod)
      where(product_id: cod)
  end

  def self.pesq_prod(q)
  #  if q
  #        joins(:product).joins(:product => :product_type , :product_color)
  #        .where(["product_type_id = ?", "#{q}"])
  #        .order('products.description')
  #  else
    #    results = group(:product_id).sum(:quantity)
    #      .order('products.description')
         joins(:product).joins(:product => [:product_type, :product_color, :product_composition, :product_size])
            .where(["product_type_id = ?", "#{q}"])
            .order('products.description')
            .group('product_types.description', 'products.description', 'product_colors.description',
                    'product_compositions.description', 'product_sizes.description')
                    .sum('quantity')
                    
  #  end
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

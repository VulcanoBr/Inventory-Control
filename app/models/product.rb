class Product < ApplicationRecord
  
  belongs_to :product_type
  belongs_to :product_composition
  belongs_to :product_color
  belongs_to :product_size
 
  validates :description, presence: true
  
  validates :description, uniqueness: {
    scope: [:product_type_id, :product_color_id, :product_composition_id, :product_size_id],
    case_sensitive: false, message: "Produto já existe"
  }

  scope :without_stock, -> { joins(:product_type).where(
          'NOT EXISTS (:product_id)',
          product_id: Stock.where('products.id = stocks.product_id')          
        ).order('product_types.description', 'products.description') }
 

  def self.search(search)
    if search
        joins(:product_type)
          .where(["lower(product_types.description) LIKE ? OR lower(products.description) LIKE ?",
                 "%#{search.downcase}%", "%#{search.downcase}%"])
          .order('product_types.description', 'products.description')
    else
        all.joins(:product_type)
          .order('product_types.description', 'products.description')
    end
      
  end

  before_create do
    self.status = "active"
  end

end

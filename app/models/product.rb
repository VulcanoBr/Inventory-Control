class Product < ApplicationRecord

  include PgSearch
  
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
 

  pg_search_scope :search, 
      against: %i[description],
      associated_against: { product_type: %i[description] },
      using: {tsearch: { prefix: true } }
        
  before_create do
    self.status = "active"
  end

end

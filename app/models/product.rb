class Product < ApplicationRecord
  belongs_to :product_type
  belongs_to :product_composition
  belongs_to :product_color
  belongs_to :product_size
end

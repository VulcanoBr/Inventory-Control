class Product < ApplicationRecord
  
  belongs_to :product_type
  belongs_to :product_composition
  belongs_to :product_color
  belongs_to :product_size
  belongs_to :supplier
#  belongs_to :stock
#  belongs_to :stock_entry

def self.search(search)
  if search
      @parameter = search.downcase 
      where(["lower(description) LIKE ?","%#{@parameter}%"])
  else
      all
  end
end

  before_create do
    self.status = "active"
  end
end

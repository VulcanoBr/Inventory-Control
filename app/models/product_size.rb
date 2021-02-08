class ProductSize < ApplicationRecord

    validates :description, presence: true, uniqueness: { case_sensitive: false }

end

class ProductColor < ApplicationRecord

    validates :description, presence: true, uniqueness: { case_sensitive: false,
                message: " da Cor já existe !!!" }

end

class ProductSize < ApplicationRecord

    validates :description, presence: true, uniqueness: { case_sensitive: false,
                message: "da Medida já existe !!!" }

end

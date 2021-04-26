class ProductType < ApplicationRecord

   

    validates :description, presence: true, uniqueness: { case_sensitive: false,
                message: "do Tipo já existe !!!" }

end

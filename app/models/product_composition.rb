class ProductComposition < ApplicationRecord

    validates :description, presence: true, uniqueness: { case_sensitive: false,
                message: "da Composição já existe !!!" }

end

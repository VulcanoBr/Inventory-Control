class AddressSupplier < ApplicationRecord
  
  belongs_to :supplier, required: false

end
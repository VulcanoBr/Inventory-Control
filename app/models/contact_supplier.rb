class ContactSupplier < ApplicationRecord
  
  belongs_to :supplier, required: false

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

end

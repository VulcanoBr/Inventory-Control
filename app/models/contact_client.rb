class ContactClient < ApplicationRecord
  belongs_to :client, required: false


  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

end

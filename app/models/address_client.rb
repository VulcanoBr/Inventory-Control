class AddressClient < ApplicationRecord
  belongs_to :client, required: false
end

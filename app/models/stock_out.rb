class StockOut < ApplicationRecord
  belongs_to :client
  belongs_to :stock
end

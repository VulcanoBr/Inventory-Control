class StockEntry < ApplicationRecord
 
  belongs_to :stock
 
  validates :date_entry, :date_invoice, presence: true

  before_validation :valida_quantidade

  after_create :update_quantity

  private

  def valida_quantidade 
    # @stock = Stock.find_by(@stock_id)
    if (quantity.blank?)
      errors.add(:quantity.to_s, ", Quantidade Nâo foi preenchida")
    else 
        if quantity < 0
            errors.add(:quantity.to_s, ", Quantidade Nâo Pode ser menor que 1")
        end
    end

    if (date_invoice.present?) && (date_entry.present?)
      if date_invoice > date_entry
        errors.add(date_invoice.strftime("%d/%m/%Y"), ", Data da Nota Fiscal,  Nâo Pode ser MAIOR que Data de Entrada  !!!")
      end
    end

  end

  def update_quantity
      new_quantity = stock.quantity + quantity
      
      if unit_price.blank?
        new_price = stock.last_unit_price
      else 
        new_price = unit_price 
      end
      stock.update(quantity: new_quantity, last_unit_price: new_price)
  end

end

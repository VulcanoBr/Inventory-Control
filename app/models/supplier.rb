class Supplier < ApplicationRecord

    include PgSearch

    has_many :products

    has_many :contact_suppliers, dependent: :destroy # possui muitod  endereços
    accepts_nested_attributes_for :contact_suppliers, reject_if: :all_blank, allow_destroy: true

    has_many :address_suppliers, dependent: :destroy # possui muitod  endereços
    accepts_nested_attributes_for :address_suppliers, reject_if: :all_blank, allow_destroy: true

    validates :supplier_name, :identification, presence: true
    
    validate :cpfcnpj

    pg_search_scope :search, 
        against: %i[supplier_name],
        using: {tsearch: { prefix: true } }
        

    private

    def cpfcnpj
        if (identification.nil?)  ||  (identification.empty?)  || (identification.blank?)
            errors.add(:identification,  "CPF ou CNPJ  não preenchido   !!!  ")
        else
            if identification.length ==  14
                cpf = CPF.new(identification)
            if !cpf.valid?
                    errors.add(cpf.formatted.to_s, "CPF  invalido   !!!  ")
                end
            else 
                if identification.length ==  18
                    cnpj = CNPJ.new(identification)
                    if !cnpj.valid?
                        errors.add(cnpj.formatted.to_s, "CNPJ  invalido   !!!  ")
                    end
                else 
                    errors.add(identification.to_s, "CPF ou CNPJ  invalido   !!!  ") 
                end 
            end
        end  
        
    end

    
end

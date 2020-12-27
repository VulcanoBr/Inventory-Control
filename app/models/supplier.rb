class Supplier < ApplicationRecord

    has_many :contact_suppliers, dependent: :destroy # possui muitod  endereços
    accepts_nested_attributes_for :contact_suppliers, reject_if: :all_blank, allow_destroy: true

    has_many :address_suppliers, dependent: :destroy # possui muitod  endereços
    accepts_nested_attributes_for :address_suppliers, reject_if: :all_blank, allow_destroy: true

    validates :supplier_name, :identification, presence: true
    
    validate :cpfcnpj

    def self.search(search)
        if search
            @parameter = search.downcase 
            where(["lower(supplier_name) LIKE ?","%#{@parameter}%"])
        else
            all
        end
    end

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

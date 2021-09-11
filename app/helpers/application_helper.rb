module ApplicationHelper
    
    def format_date(data)
        data.strftime("%d/%m/%Y") 
    end

    def format_date_hours(datetime)
        datetime.strftime("%d/%m/%Y %H:%M")
    end

    def format_price(preco)
        number_to_currency(preco, unit: "R$", separator: ",", delimiter: ".")
    end
    
    def format_quantity(quantidade)
        number_with_delimiter(quantidade, delimiter: ".")
    end
    
end

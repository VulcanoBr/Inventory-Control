document.addEventListener('DOMContentLoaded', () => {
  
  priceemreal();
    
});
      
function priceemreal() {
      document.querySelectorAll(".price-with-mask").forEach((input) => {
            const val = document.querySelector("input[name='stock_entries[unit_price]']").value
           
            if (val.length > 0) {
                valreal = val.replace(/[.]/g, ",");
                document.querySelector("input[name='stock_entries[unit_price]']").value = valreal;
            };

      });
        
};

document.addEventListener('DOMContentLoaded', () => {

      convert();
    
});
      
function convert() {
  document.querySelectorAll(".convert").forEach((submit) => {
    submit.addEventListener("click", ({ target }) => {
        const val = document.querySelector("input[name='stock_entry[unit_price]']").value
          .replace(/[.]/g, "");
        valdecimal = val.replace(/[,]/g, ".");

        document.querySelector("input[name='stock_entry[unit_price]']").value = valdecimal;
    });
  });
        
};
document.addEventListener('DOMContentLoaded', () => {

      convertlastprice();
    
});
      
function convertlastprice() {
  document.querySelectorAll(".convertlastprice").forEach((submit) => {
    submit.addEventListener("click", ({ target }) => {
        const val = document.querySelector("input[name='stock[last_unit_price]']").value
          .replace(/[.]/g, "");
        valdecimal = val.replace(/[,]/g, "");
        valor = Number(valdecimal) / 100;

        document.querySelector("input[name='stock[last_unit_price]']").value = valor;
    });
  });
        
};
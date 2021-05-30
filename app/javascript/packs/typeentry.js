document.addEventListener("DOMContentLoaded", () => {
    addTypeEntryDocumentField();
});

function adicionaZero(numero){
    if (numero <= 9) 
        return "0" + numero;
    else
        return numero; 
}

function fill_form() {
    var data = new Date();
    datas = (adicionaZero(data.getFullYear().toString()) + "-" + 
            (adicionaZero(data.getMonth()).toString()) + "-" + 
            (adicionaZero(data.getDate()).toString()));
    document.querySelector("input[name='stock_entry[date_entry]']").value = datas;
    document.querySelector("input[name='stock_entry[date_invoice]']").value = datas;
    document.querySelector("input[name='stock_entry[unit_price]']").value = 0.00;
    document.querySelector("input[name='stock_entry[invoice]']").value = "Sem Nota Fiscal";
    document.querySelector("input[name='stock_entry[quantity]']").focus();
};

function clean_form() {
    document.querySelector("input[name='stock_entry[date_entry]']").value = "";
    document.querySelector("input[name='stock_entry[date_invoice]']").value = "";
    document.querySelector("input[name='stock_entry[unit_price]']").value = 0.00;
    document.querySelector("input[name='stock_entry[invoice]']").value = "";
    document.querySelector("input[name='stock_entry[quantity]']").value = 0;
    document.querySelector("input[name='stock_entry[description]']").value = "";
}

function addTypeEntryDocumentField() {
    
      document.querySelectorAll("select[name='stock_entry[type_entry]']").forEach((select) => {
         
        select.addEventListener("change", ({ target }) => {
        //var result = select.options[select.selectedIndex].value;
        
       // document.querySelector("input[name='stock_entry[type_entry]']").value = result;
            switch (target.value) {
            case "0":
                clean_form();
                
                break;
            case "1":
                fill_form();
                document.querySelector("input[name='stock_entry[description]']").value = "Devolução para o Estoque";
                break;
            case "2":
                fill_form();
                document.querySelector("input[name='stock_entry[description]']").value = "Devolução de Cliente";
                break;
            case "3":
                fill_form();
                document.querySelector("input[name='stock_entry[description]']").value = "Material Fabricado";
                break;
            default :
                clean_form();
            }
      });
    });
};


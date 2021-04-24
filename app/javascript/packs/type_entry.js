document.addEventListener("DOMContentLoaded", () => {
    addTypeEntryDocumentField();
});

function adicionaZero(numero){
    if (numero <= 9) 
        return "0" + numero;
    else
        return numero; 
}

function stock_return() {
    var data = new Date();
    data = (adicionaZero(data.getFullYear().toString()) + "-" + (adicionaZero(data.getMonth()+1).toString()) + "-" + data.getDate());
    document.querySelector("input[name='stock_entry[date_entry]']").value = data;
    document.querySelector("input[name='stock_entry[date_invoice]']").value = data.slice(0, 10);
    document.querySelector("input[name='stock_entry[unit_price]']").value = 0.00;
    document.querySelector("input[name='stock_entry[invoice]']").value = "Sem Nota Fiscal";
    document.querySelector("input[name='stock_entry[description]']").value = "Retorno ao Estoque";
    document.querySelector("input[name='stock_entry[quantity]']").focus();
    

};

function client_return() {
    var data = new Date().toISOString().slice(0, 10);
    document.querySelector("input[name='stock_entry[date_entry]']").value = data;
    document.querySelector("input[name='stock_entry[date_invoice]']").value = data;
    document.querySelector("input[name='stock_entry[unit_price]']").value = 0.01;
    document.querySelector("input[name='stock_entry[invoice]']").value = "Sem Nota Fiscal";
    document.querySelector("input[name='stock_entry[description]']").value = "Devolução de Cliente";
}

function addTypeEntryDocumentField() {
      document.querySelectorAll(".type_entry").forEach((select) => {
      select.addEventListener("change", ({ target }) => {
        var result = select.options[select.selectedIndex].text;
        
        document.querySelector("input[name='stock_entry[type_entry]']").value = result;
            switch (target.value) {
            case "1":
                document.querySelector("input[name='stock_entry[description]']").value = "Esdtou aqui";
           //     document.querySelector("input[name='stock_entry[type_entry]']").value = result;
                // document.getElementsByTagName('input').reset();
                break;
    
            case "2":
                stock_return();
            //    document.querySelector("input[name='stock_entry[type_entry]']").value = result;
                break;
            case "3":
                client_return();
            //    document.querySelector("input[name='stock_entry[type_entry]']").value = result;
                break;
            default :
            document.querySelector("input[name='stock_entry[description]']").value = "Não Esdtou aqui";
            }
      });
    });
};


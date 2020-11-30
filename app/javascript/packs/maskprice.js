
document.addEventListener('DOMContentLoaded', () => {
//(function ()
 //   {
        var v = "";
        document.querySelector("input[name='stock_entry[unit_price]']").placeholder  = "0,00";
        document.getElementById('valor').addEventListener('input', function(e) {
            v = e.target.value.replace(/\D/g,'');
            v = (v/100).toFixed(2) + '';
            v = v.replace(".", ",");
            v = v.replace(/(\d)(\d{3})(\d{3}),/g, "$1.$2.$3,");
            v = v.replace(/(\d)(\d{3}),/g, "$1.$2,");
            e.target.value = v;

        });
    });

    
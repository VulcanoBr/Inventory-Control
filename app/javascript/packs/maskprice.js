
document.addEventListener('DOMContentLoaded', () => {
//(function ()
 //   {
        var c = "";
        document.querySelector("input[name='stock_entry[unit_price]']").placeholder  = "0,00";
        document.getElementById('valor').addEventListener('input', function(e) {
            c = e.target.value;
            c = c + '';
            c = parseInt(c.replace(/[\D]+/g,''));
            c = c + '';
            c = c.replace(/([0-9]{2})$/g, ",$1");
        
            if (c.length > 6) {
                c = c.replace(/([0-9]{3}),([0-9]{2}$)/g, ".$1,$2");
            };
            e.target.value = c;

        });
    });

    
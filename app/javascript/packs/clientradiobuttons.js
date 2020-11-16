
x = "";

(function (){
    var radios = document.getElementsByName('exp');
    
    for(var i = 0; i < radios.length; i++){
        radios[i].onclick = function(){
            x = this.value;
            if (x === "cpf") {
                document.querySelector("input[name='client[identification]']").value  = "";
                document.querySelector("input[name='client[identification]']").placeholder = "CPF";
                mascaracpf();   
            }
            
            else  if (x === "cnpj") {
                    document.querySelector("input[name='client[identification]']").value  = "";
                    document.querySelector("input[name='client[identification]']").placeholder = "CNPJ";
                    mascaracnpj();
                    }
                   else
                        alert(" Escolha CPF  ou  CNPJ");
        
        }
    }
})();

function mascaracpf( ){
    var c = "";
    document.getElementById('cpfcnpj').addEventListener('input', function(e) {
        c = e.target.value.replace(/\D/g, '').match(/(\d{0,3})(\d{0,3})(\d{0,3})(\d{0,2})/);
        e.target.value = !c[2] ? c[1] : c[1] + '.' + c[2] + '.' + c[3] + (c[4] ? '-' + c[4] : '');
    });

}

function mascaracnpj( ){
    var z = "";
    document.getElementById('cpfcnpj').addEventListener('input', function(e) {
        z = e.target.value.replace(/\D/g, '').match(/(\d{0,2})(\d{0,3})(\d{0,3})(\d{0,4})(\d{0,2})/);
        e.target.value = !z[2] ? z[1] : z[1] + '.' + z[2] + '.' + z[3] + '/' + z[4] + (z[5] ? '-' + z[5] : '');
    });

}



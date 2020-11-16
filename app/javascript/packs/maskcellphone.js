
(function (){
   
    var d = "";
    document.getElementById('cellphone').addEventListener('input', function(e) {
        d = e.target.value.replace(/\D/g, '').match(/(\d{0,2})(\d{0,5})(\d{0,4})/);
        e.target.value = !d[2] ? d[1] : '(' + d[1] + ') ' + d[2] + (d[3] ? '-' + d[3] : '');
    });
    
})();


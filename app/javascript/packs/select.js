document.addEventListener("DOMContentLoaded", () => {
    alert("aqui");
    document.querySelector("select[name='stock_out[stock_id]']").addEventListener("click", (event) => {
      const productName = event.target.value;  
      alert(productName);  
      fetch(`/stock_outs/get_stock?stock_id=${productName}`)
        .then((data) => data.json())
        .then(({ stock }) => document.querySelector("#stock_out_stock").value = stock);
    });
});
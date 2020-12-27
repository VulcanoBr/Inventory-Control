
document.addEventListener("DOMContentLoaded", () => {
    addMaskToPriceFields();
});

function addMaskToPriceFields() {
    document.querySelectorAll(".price-with-mask").forEach((input) => {
      input.addEventListener("keyup", ({ target }) => {
        target.value = (target.value.replace(/\D/g, "") / 100)
          .toFixed(2)
          .replace(".", ",")
          .replace(/(\d)(\d{3})(\d{3}),/g, "$1.$2.$3,")
          .replace(/(\d)(\d{3}),/g, "$1.$2,");
      });
    });
};
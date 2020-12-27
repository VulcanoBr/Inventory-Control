
document.addEventListener("DOMContentLoaded", () => {
    addMaskToDocumentField();
});
  
const cpfMask = ({ target }) => {
    const x = target.value.replace(/\D/g, "").match(/(\d{0,3})(\d{0,3})(\d{0,3})(\d{0,2})/);
    target.value = x[2] ? `${x[1]}.${x[2]}.${x[3]}${x[4] ? "-" + x[4] : ""}` : x[1];
};
  
const cnpjMask = ({ target }) => {
    const x = target.value.replace(/\D/g, "").match(/(\d{0,2})(\d{0,3})(\d{0,3})(\d{0,4})(\d{0,2})/);
    target.value = x[2] ? `${x[1]}.${x[2]}.${x[3]}/${x[4]}${x[5] ? "-" + x[5] : ""}` : x[1];
};
  
function addMaskToDocumentField() {
    const cpfCnpjInput = document.querySelector("input[name='client[identification]']");
  
    document.querySelectorAll("input[name=document_type]").forEach((radioButton) => {
      radioButton.addEventListener("change", ({ target }) => {
        cpfCnpjInput.disabled = false;
        cpfCnpjInput.placeholder = target.value.toUpperCase();
        cpfCnpjInput.value = ""; // Limpa o campo
        cpfCnpjInput.focus();
  
        switch (target.value) {
          case "cpf":
            cpfCnpjInput.removeEventListener("keyup", cnpjMask);
            cpfCnpjInput.addEventListener("keyup", cpfMask);
            break;
  
          case "cnpj":
            cpfCnpjInput.removeEventListener("keyup", cpfMask);
            cpfCnpjInput.addEventListener("keyup", cnpjMask);
            break;
        };
      });
    });
};



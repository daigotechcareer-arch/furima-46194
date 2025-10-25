const price = () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return; // 商品出品ページ以外では動かないようにする

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    if (inputValue >= 300 && inputValue <= 9999999) {
      const tax = Math.floor(inputValue * 0.1);
      const profit = Math.floor(inputValue - tax);
      addTaxDom.innerHTML = tax;
      profitDom.innerHTML = profit;
    } else {
      addTaxDom.innerHTML = '';
      profitDom.innerHTML = '';
    }
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);

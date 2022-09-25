function calc () {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    let calcTax = Math.floor(itemPrice.value * 0.1);
    const taxPrice = document.getElementById("add-tax-price");
    taxPrice.innerHTML = `${calcTax}`;
    let calcProfit = Math.floor(itemPrice.value - calcTax);
    const profit = document.getElementById("profit")
    profit.innerHTML = `${calcProfit}`
  });
};

window.addEventListener('load', calc);
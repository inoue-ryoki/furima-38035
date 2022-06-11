function commission() {
  const price = document.getElementById("item-price")
  // 料金入力欄のidを取得


  price.addEventListener("input", () => {

    const commission = document.getElementById("add-tax-price");
    // 料金の手数料の入力欄のidを取得
    const gain = document.getElementById("profit");
    // 料金の利益のidを取得
    const inputValue = price.value;
    // 入力された料金の値を取得
    const tax = Math.floor(inputValue * 0.1);
    // 手数料の計算
    const profit = Math.floor(inputValue - tax)
    // 販売履歴の計算


    commission.innerHTML = tax
    gain.innerHTML = profit



  })



};

window.addEventListener('load', commission);

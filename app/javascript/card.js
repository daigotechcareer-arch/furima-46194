// app/javascript/card.js

const pay = () => {
  const form = document.getElementById("charge-form");
  if (!form) return;

  // 公開鍵をセット
  const publicKey = document.querySelector('meta[name="payjp-public-key"]').content;
  const payjp = Payjp(publicKey);
  const elements = payjp.elements();

  // 各入力フィールドを作成してHTMLの該当箇所にマウント
  const numberElement = elements.create("cardNumber");
  const expiryElement = elements.create("cardExpiry");
  const cvcElement = elements.create("cardCvc");

  numberElement.mount("#number-form");
  expiryElement.mount("#expiry-form");
  cvcElement.mount("#cvc-form");

  // フォーム送信時の処理
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    payjp.createToken(numberElement).then((response) => {
      if (response.error) {
        alert("カード情報が正しくありません。");
      } else {
        const token = response.id;
        const tokenInput = `<input value=${token} type="hidden" name="token">`;
        form.insertAdjacentHTML("beforeend", tokenInput);
        form.submit();
      }
    });
  });
};

+ window.addEventListener("turbo:load", pay);
+ window.addEventListener("turbo:render", pay);

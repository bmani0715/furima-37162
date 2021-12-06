const pay = () => {
<<<<<<< Updated upstream
 
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  //Payjp.setPublicKey("pk_test_1e4456a5abd9df0ed1df5bb1");
=======
  
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
>>>>>>> Stashed changes
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    
    const card = {
      number: formData.get("item_order[number]"),
      cvc: formData.get("item_order[cvc]"),
      exp_month: formData.get("item_order[exp_month]"),
<<<<<<< Updated upstream
      exp_year: `20${formData.get("item_order[exp_year]")}`
=======
      exp_year: `20${formData.get("item_order[exp_year]")}`,
>>>>>>> Stashed changes
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

<<<<<<< Updated upstream
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
=======
      document.getElementById("item_order_number").removeAttribute("name");
      document.getElementById("item_order_cvc").removeAttribute("name");
      document.getElementById("item_order_exp_month").removeAttribute("name");
      document.getElementById("item_order_exp_year").removeAttribute("name");
>>>>>>> Stashed changes

      document.getElementById("charge-form").submit();
    });
  });
};
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
window.addEventListener("load", pay);
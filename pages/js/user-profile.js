var card = new Card({
  form: ".creditForm",
  container: ".card-wrapper",
  formSelectors:{
    numberInput: 'input#card_number',
    expiryInput: 'input#exp_date',
    nameInput: 'input#card_name'
  }
})

$("input#card_number").detectCard().on("cardChange", function(e, card){
  $('#card_type').val(card.type);
});

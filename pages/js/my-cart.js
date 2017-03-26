var prodItems;
var prodPrice = new Array();
var totalPrice = 0;
$(document).ready(function() {
   prodItems = $('.item-row');
  //  Get the Inner Text of all Total price
  //  Parse them to Float
  //  Compute Total Price
  for(i = 0; i < prodItems.length; i++){
    prodPrice[i] = parseFloat(prodItems[i].cells[3].innerText);
    totalPrice += prodPrice[i];
  }
  // Display Total Price
  $('.total-amount').text(totalPrice.toFixed(2) + " PHP")
});

// Delete an Item
$('.removeRowBTN').click(function(event) {
  var removeRow = $(this).parents('.item-row');
  $('.name-modal').text(removeRow[0].cells[0].innerText);
  $('.price-modal').text(removeRow[0].cells[1].innerText);
  $('.quantity-modal').text(removeRow[0].cells[2].innerText);
  $('.total-modal').text(removeRow[0].cells[3].innerText);
  // Open a Modal
  $('#removeItemModal').modal('show');
  $('#removeActionBTN').click(function(event) {
    // Confirm: AJAX
    $.ajax({
      url: '/path/to/file',
      type: 'POST',
      dataType: 'JSON',
      data: {
        productName: removeRow[0].cells[0].innerText,
        productPrice: parseFloat(removeRow[0].cells[1].innerText),
        productQuantity: removeRow[0].cells[2].innerText,
        productTotal: parseFloat(removeRow[0].cells[3].innerText)
      }
    })
    .done(function() {
      console.log("success");
      // Remove Row
      removeRow.remove();
      // Update Total Price
      totalPrice -= parseFloat(removeRow[0].cells[3].innerText);
      $('.total-amount').text(totalPrice.toFixed(2) + " PHP")
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });

    $('#removeItemModal').modal('hide');
  });
});

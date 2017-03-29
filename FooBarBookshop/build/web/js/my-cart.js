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
  $('#removeActionBTN').unbind('click');
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
      generateAlert('success', '<h4 style="color: white">Your item is successfully removed.</h4>');
      // Remove Row
      removeRow.remove();
      // Update Total Price
      totalPrice -= parseFloat(removeRow[0].cells[3].innerText);
      $('.total-amount').text(totalPrice.toFixed(2) + " PHP")
    })
    .fail(function() {
      generateAlert('error', '<h4 style="color: white">Oops, Something went wrong removing your item</h4> </br> Try again later.');
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });

    $('#removeItemModal').modal('hide');
  });
});

function generateAlert(type, message){
  var n = noty({
      text        : message,
      type        : type,
      dismissQueue: true,
      progressBar : true,
      timeout     : 5000,
      layout      : 'topRight',
      closeWith   : ['click'],
      theme       : 'relax',
      maxVisible  : 10,
      animation   : {
          open  : 'animated bounceInRight',
          close : 'animated bounceOutRight',
          easing: 'swing',
          speed : 500
      }
  });
}

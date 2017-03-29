$('#postActionBTN').click(function(event) {
  // Check if Text area is empty
  if($('.modal textarea').val().trim() == "" || $('.modal textarea').val().trim().length == 0 ){
    generateAlert('warning', '<h4>Your review message is empty</h4> Please enter a non-empty message');
    console.log("Empty Review Message");
    $('#reviewModal').modal('hide');
    return;
  }
  $.ajax({
    url: 'addReview',
    type: 'POST',
    dataType: 'JSON',
    data: {
      message: $('.modal textarea').val().trim(),
      id: $('.productID').text()}
  })
  .done(function() {
    console.log("success");
    generateAlert('success', '<h4 style="color:white">Your review has been posted successfully :-)</h4>');
  })
  .fail(function() {
    console.log("error");
    generateAlert('error',
    '<h4 style="color:white">Oops, Something went wrong posting your review </br></h4> Try Again Later :(');
  })
  .always(function() {
    console.log("complete");
    $('#reviewModal').modal('hide');
  });


});

$('#reviewModal').on('hidden.bs.modal', function () {
  $(this).find("input,textarea,select").val('').end();
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

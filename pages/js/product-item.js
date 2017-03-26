$('#postActionBTN').click(function(event) {
  // Check if Text area is empty
  if($('.modal textarea').val().trim() == "" || $('.modal textarea').val().trim().length == 0 ){
    console.log("Empty Review Message");
    $('#reviewModal').modal('hide');
    return;
  }
  $.ajax({
    url: '/path/to/file',
    type: 'POST',
    dataType: 'JSON',
    data: {
      message: $('.modal textarea').val().trim()}
  })
  .done(function() {
    console.log("success");
  })
  .fail(function() {
    console.log("error");
  })
  .always(function() {
    console.log("complete");
    $('#reviewModal').modal('hide');
  });


});

$('#reviewModal').on('hidden.bs.modal', function () {
  $(this).find("input,textarea,select").val('').end();
});

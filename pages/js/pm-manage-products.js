changeContainerSize();
var $table = $('#productTable');

$(document).ready(function() {
  $table.bootstrapTable({
    classes: 'table table-reponsive table-striped table-no-bordered',
    smartDisplay: true,
    resizable: true,
    showToggle: true,
    showColumns: true,
    minimumCountColumns: 3,
    pagination: true,
    onlyInfoPagination: false,
    search: true,
    toolbar: '.table-toolbar',
    toolbarAlign: 'right',
    pageSize: 10,
    formatShowingRows: function(pageFrom, pageTo, totalRows) {

    },
    formatRecordsPerPage: function(pageNumber) {

    },
    formatDetailPagination: function(totalRows) {
      return ;
    },
    onClickRow: function(row, $element){
    },
  });
});

function actionFormatter(value, row, index){
  return [
    '<a class="remove" href="javascript:void(0)" title="Remove">',
    '<i class="fa fa-times text-danger"></i>',
    '</a>'
  ].join('');
}

function descriptionFormatter(value, row, index) {
    return value.substring(0,10) + "...";
}



window.actionEvents = {
    'click .remove': function (e, value, row, index) {
        changeConfirmModal(row.productID, row.productName, row.productPrice);
        $('#confirmModal').modal();
        $('#confirmActionBTN').click(function(event) {
          $table.bootstrapTable('remove', {
            field: 'productID',
            values: [row.productID]
          })
          $('#confirmModal').modal('hide');
        });
    }
}


var $validate = $('#addProdForm').validate({
  rules:{
    productName:{
      required: true,
      maxlength: 40
    },
    productPrice:{
      required: true,
      number: true,
      min: 1,
      max: 1000000
    },
    productDesc:{
      maxlength: 200
    }
  },
  errorElement: 'div',
  errorPlacement: function(error, element) {
      error.addClass('help-block');


      if (element.prop('type') === 'checkbox') {
          error.insertAfter('element.parent("label")');
      } else {
          error.insertAfter(element);
      }

      if (!element.next('span')[0]) {
          $("<span class='glyphicon glyphicon-remove form-control-feedback'></span>").insertAfter(element);
      }

  },
  success: function(label, element) {
      // Add the span element, if doesn't exists, and apply the icon classes to it.
      if (!$(element).next("span")[0]) {
          $("<span class='glyphicon glyphicon-ok form-control-feedback'></span>").insertAfter($(element));
      }
  },
  highlight: function(element, errorClass, validClass) {
      $(element).parents(".form-group.has-feedback").addClass("has-error").removeClass("has-success");
      $(element).next("span").addClass("glyphicon-remove").removeClass("glyphicon-ok");
  },
  unhighlight: function(element, errorClass, validClass) {
      $(element).parents(".form-group.has-feedback").addClass("has-success").removeClass("has-error");
      $(element).next("span").addClass("glyphicon-ok").removeClass("glyphicon-remove");
  }
});

$('#addProdModal').on('hidden.bs.modal', function () {
  $(this).find("input,textarea,select").val('').end();
  $validate.resetForm();
  $('.has-error').removeClass('has-error');
  $('.has-success').removeClass('has-success');
  $('.form-control-feedback').remove();
});

function changeConfirmModal(userID, userName, userType){
  $('.productIDModal').text(userID);
  $('.productNameModal').text(userName);
  $('.productPriceModal').text(userType);
}

// Change container to fluid
// If window size is <992
$(window).resize(function(event) {
  changeContainerSize();
});

// Change container size if window size is <992
function changeContainerSize(){
  if ( $(window).width() < 992 ){
    $('.pm-container').removeClass('container');
    $('.pm-container').addClass('container-fluid');
  }

  else {
    $('.pm-container').removeClass('container-fluid');
    $('.pm-container').addClass('container');
  }
}

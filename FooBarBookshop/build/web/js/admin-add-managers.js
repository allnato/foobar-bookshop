  changeContainerSize();
  var $PMtable = $('#PMtable');
  var $SMtable = $('#SMtable');

$(document).ready(function() {
  $PMtable.bootstrapTable({
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
  $SMtable.bootstrapTable({
    classes: 'table table-reponsive table-striped table-no-bordered',
    smartDisplay: true,
    resizable: true,
    showToggle: true,
    showColumns: true,
    minimumCountColumns: 3,
    pagination: true,
    sortable: true,
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



  window.PMactionEvents = {
      'click .remove': function (e, value, row, index) {
          $PMtable.bootstrapTable('remove', {
            field: 'PMid',
            values: [row.PMid]
          })
      }
  }

  window.SMactionEvents = {
      'click .remove': function (e, value, row, index) {
          $SMtable.bootstrapTable('remove', {
            field: 'SMid',
            values: [row.SMid]
          })
      }
  }




  var $validate = $('#addMngrForm').validate({
    rules: {
      firstName:{
        required: true,
        maxlength: 35
      },
      middleInitial:{
        required: true,
        maxlength: 1
      },
      lastName:{
        required: true,
        maxlength: 35
      },
      email:{
        required: true,
        email: true,
        maxlength: 254
      },
      birthDate:{
        required: true,
        date: true
      },
      username:{
        required: true,
        minlength: 4,
        maxlength: 15,
        username: true
      },
      password:{
        required: true,
        minlength: 8,
        maxlength: 100
      },
      password_confirm:{
        required: true,
        equalTo: '#password'
      },
      product_type:{
        required: true
      }
    },
    messages:{
      firstName: "Please enter your first name",
      lastName: "Please enter you last name",
      middleInitial: "Please enter your middle initial",
      email: "Please enter your Email"
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

  $('#addMngrModal').on('hidden.bs.modal', function () {
    $(this).find("input,textarea,select").val('').end();
    $validate.resetForm();
    $('.has-error').removeClass('has-error');
    $('.has-success').removeClass('has-success');
    $('.form-control-feedback').remove();
  });


  // Change container to fluid
  // If window size is <992
  $(window).resize(function(event) {
    changeContainerSize();
  });

  // Change container size if window size is <992
  function changeContainerSize(){
    if ( $(window).width() < 992 ){
      $('.admin-container').removeClass('container');
      $('.admin-container').addClass('container-fluid');
    }

    else {
      $('.admin-container').removeClass('container-fluid');
      $('.admin-container').addClass('container');
    }
  }

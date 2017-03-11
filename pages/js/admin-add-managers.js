
  var $PMtable = $('#PMtable');
  var $SMtable = $('#SMtable');

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
    $('.has-error').removeClass('has-error');
    $('.form-control-feedback').remove();
  });

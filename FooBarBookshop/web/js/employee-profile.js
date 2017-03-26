// Check Window size @ startup
changeContainerSize();

// Initialize Date Picker
$('#birth_date').datepicker({
  format: "mm-dd-yyyy",
  startDate: "01-01-1800",
  maxViewMode: 3,
  todayBtn: "linked",
  todayHighlight: true,
  toggleActive: true
});

// Username Check Algorithm
$.validator.addMethod("username", function(value, element){
  return this.optional(element) || /^(\w+)$/g.test(value);
}, "Username must contain only letters, numbers, and underscores ('_')");

// Change container to fluid
// If window size is <992
$(window).resize(function(event) {
  changeContainerSize();
});

// Personal Information Form Validation
var $validate = $('#personal-information-form').validate({
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
    email:{
      required: true
    }
  },
  messages:{
    firstName: "Please enter your first name",
    lastName: "Please enter you last name",
    middleInitial: "Please enter your middle initial"
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

// Password Form Validation
var $validate = $('#password-form').validate({
  rules: {
    old_password:{
      required: true
    },
    password:{
      required: true,
      minlength: 8,
      maxlength: 100
    },
    password_confirm:{
      required: true,
      equalTo: '#newPassword'
    },
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

// Action Buttons
// Edit Profile Information
$('#edit-profile-btn').click(function(event) {
  $('#personal-information-form select').removeAttr('disabled');
  $('#personal-information-form input').removeAttr('disabled');
  $('#personal-information-form button').removeAttr('disabled');
  $('#personal-information-form button').removeClass('btn-default');
  $('#personal-information-form button').addClass('btn-success');

});

$('#personal-information-form button').click(function(event) {
  if($('#personal-information-form').valid()){
    console.log('true');
  }
  else {
    console.log('false');
  }
});

// Change container size if window size is <992
function changeContainerSize(){
  if ( $(window).width() < 992 ){
    $('.profile-container').removeClass('container');
    $('.profile-container').addClass('container-fluid');
  }

  else {
    $('.profile-container').removeClass('container-fluid');
    $('.profile-container').addClass('container');
  }
}

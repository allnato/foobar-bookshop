// Check Window size @ startup
changeContainerSize();

// Initialize card.js
var card = new Card({
  form: ".creditForm",
  container: ".card-wrapper",
  formSelectors:{
    numberInput: 'input#card_number',
    expiryInput: 'input#exp_date',
    nameInput: 'input#card_name'
  }
});

// Initialize Date Picker
$('#birth_date').datepicker({
  format: "yyyy-mm-dd", 
  startDate: "01-01-1800",
  maxViewMode: 3,
  todayBtn: "linked",
  todayHighlight: true,
  toggleActive: true
});

// Luhn Algorithm (For Credit Card)
$.validator.addMethod( "creditcard", function( value, element ) {
	if ( this.optional( element ) ) {
		return "dependency-mismatch";
	}

	// Accept only spaces, digits and dashes
	if ( /[^0-9 \-]+/.test( value ) ) {
		return false;
	}

	var nCheck = 0,
		nDigit = 0,
		bEven = false,
		n, cDigit;

	value = value.replace( /\D/g, "" );
	// Basing min and max length on
	// http://developer.ean.com/general_info/Valid_Credit_Card_Types
	if ( value.length < 13 || value.length > 19 ) {
		return false;
	}

	for ( n = value.length - 1; n >= 0; n-- ) {
		cDigit = value.charAt( n );
		nDigit = parseInt( cDigit, 10 );
		if ( bEven ) {
			if ( ( nDigit *= 2 ) > 9 ) {
				nDigit -= 9;
			}
		}

		nCheck += nDigit;
		bEven = !bEven;
	}

	return ( nCheck % 10 ) === 0;
}, "Please enter a valid credit card number." );

// Username Check Algorithm
$.validator.addMethod("username", function(value, element){
  return this.optional(element) || /^(\w+)$/g.test(value);
}, "Username must contain only letters, numbers, and underscores ('_')");

// Display Card Type
$("input#card_number").detectCard().on("cardChange", function(e, card){
  $('#card_type').val(card.type);
});

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
    b_address:{
      required: true,
      maxlength: 128
    },
    b_city:{
      required: true,
      maxlength: 30
    },
    b_zipcode:{
      required: true,
      maxlength: 32,
      digits: true
    },
    b_region:{
      required: true,
      maxlength: 30
    },
    b_country:{
      required: true
    },
    d_address:{
      required: true,
      maxlength: 128
    },
    d_city:{
      required: true,
      maxlength: 30
    },
    d_zipcode:{
      required: true,
      maxlength: 32,
      digits: true
    },
    d_region:{
      required: true,
      maxlength: 30
    },
    d_country:{
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

// Credit Card Validation
var $validate = $('#credit-card-form').validate({
  rules: {
    cardName: {
      required: true
    },
    cardNum:{
      required: true,
      creditcard: true
    },
    cardType:{
      required: true
    },
    cardExp:{
      required: true
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

// Validate when select field change
$('select').change(function(event) {
  $(this).valid();
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

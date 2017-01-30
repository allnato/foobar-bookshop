$(document).ready(function() {


    var $validate = $('#register-form').validate({
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
        b_address:{
          required: true,
          maxlength: 50
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
          maxlength: 30
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
        },
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
      messages:{
        firstName: "Please enter your first name",
        lastName: "Please enter you last name",
        middleInitial: "Please enter your middle initial",
        email: "Please enter your Email address so we can contact you"
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

    $('.register-wizard').bootstrapWizard({
      'tabClass': 'nav nav-pills',
      'onTabShow': function(tab, navigation, index){
        var $total = navigation.find('li').length;
        var $current = index + 1;
        var $percent = ($current/$total) * 100;
        $('.register-wizard .progress-bar').css('width', $percent+'%');
      },
      'onNext': function(tab, navigation, index){
        var $valid = $("#register-form").valid();
        if(!$valid){
          $validate.focusInvalid();
          return false;
        }
      },
      'onTabClick': function(tab, navigation, index){
        var $valid = $("#register-form").valid();
        if(!$valid){
          $validate.focusInvalid();
          return false;
        }
      }
    });

    var card = new Card({
      form: "#register-form",
      container: ".card-wrapper",
      formSelectors:{
        numberInput: 'input#card_number',
        expiryInput: 'input#exp_date',
        nameInput: 'input#card_name'
      }
    })

    $("input#card_number").detectCard().on("cardChange", function(e, card){
      console.log(card.type);
    });

    $('#birth_date').datepicker({
      format: "mm-dd-yyyy",
      startDate: "01-01-1800",
      maxViewMode: 3,
      todayBtn: "linked",
      todayHighlight: true,
      toggleActive: true
    });
});

$.validator.addMethod("username", function(value, element){
  return this.optional(element) || /^(\w+)$/g.test(value);
}, "Username must contain only letters, numbers, and underscores ('_')");
// http://jqueryvalidation.org/creditcard-method/
// based on http://en.wikipedia.org/wiki/Luhn_algorithm
$.validator.addMethod( "creditcard", function( value, element ) {
	if ( this.optional( element ) ) {
		return "dependency-mismatch";
	}

	// Accept only spaces, digits and dashes
	if ( /[^0-9 \-]+/.test( value ) ) {
    console.log("DITO HERE maybe");
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
    console.log("DITO HERE");
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

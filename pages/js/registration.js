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
          maxlength: 15
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
        card_name: {
          required: true
        },
        card_number:{
          required: true
        },
        card_type:{
          required: true
        },
        card_exp:{
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
});

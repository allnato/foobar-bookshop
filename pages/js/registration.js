$(document).ready(function() {
    var $validate = $('#register-form').validate({
      rules: {
        firstName:{

        },
        middleInitial:{

        },
        lastName:{

        },
        email:{

        },
        birthDate:{

        },
        username:{

        },
        password:{

        },
        password_confirm:{

        },
        b_address:{

        },
        b_city:{

        },
        b_zipcode:{

        },
        b_region:{

        },
        b_country:{

        },
        d_address:{

        },
        d_city:{

        },
        d_zipcode:{

        },
        d_region:{

        },
        d_country:{

        },
        card_name: {

        },
        card_number:{

        },
        card_type:{

        },
        card_exp:{

        }
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
      }
    });
});

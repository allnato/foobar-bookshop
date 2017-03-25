<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Foobar | Forgot Password</title>
  <link rel="icon" type="image/png" sizes="96x96" href="img/favicon-96x96.png">

  <!-- Bootstrap stylesheet -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap-lumen.min.css">
  <!-- Fonts and Color -->
  <link rel="stylesheet" href="css/fonts.css">
  <link rel="stylesheet" href="css/palette.css">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <!-- Page CSS -->
  <link rel="stylesheet" href="css/navigation.css">
  <link rel="stylesheet" href="css/forgot_password.css">

  <style media="screen">
  .help-block{
    position: absolute;
    margin-top: 0px;
    margin-bottom: 0px;
  }

  .form-group{
    margin-bottom: 28px;
  }
  </style>

</head>

<body>
  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navigation" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a href="#" class="navbar-brand">fb</a>
      </div>
      <div class="collapse navbar-collapse" id="navigation">
        <ul class="nav navbar-nav">
          <li><a href="">Home</a></li>
          <li><a href="">About us</a></li>
        </ul>
        <p class="navbar-text navbar-right">Made with <i class="fa fa-heart"></i> by foobar</p>
      </div>
    </div>
  </nav>
  <div class="wrapper container">
    <div class="row">
      <div class="col-sm-4 col-sm-offset-4">
        <div class="panel panel-primary">
          <div class="panel-heading text-center">
            Change your password
          </div>
          <div class="panel-body">
            <!-- Enter Email Form -->
            <form action="updatePassword" method="POST" id="password_form">
              <h3 class="text-center"><i class="fa fa-lock fa-lg"></i></h3>
              <div class="form-group has-feedback">
                <label for="password">Enter your new password</label>
                <input type="password" class="form-control lato" id="password" name="password">
              </div>
              <div class="form-group has-feedback">
                <label for="password_again">Retype your new password</label>
                <input type="password" class="form-control lato" id="password_again" name="password_confirm">
              </div>
              <button type="submit" class="btn btn-success form-control" name="submit">Submit</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
<script src="js/jquery.min.js" charset="utf-8"></script>
<script src="bootstrap/js/bootstrap.min.js" charset="utf-8"></script>
<script src="js/jquery.validate.min.js" charset="utf-8"></script>
<script type="text/javascript">
  var $validate = $('#password_form').validate({
    rules: {
      password:{
        required: true,
        minlength: 8,
        maxlength: 100
      },
      password_confirm:{
        required: true,
        equalTo: '#password'
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
  })
</script>
</html>

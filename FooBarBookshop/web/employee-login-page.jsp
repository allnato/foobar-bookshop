<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Foobar Bookshop</title>

    <!-- Bootstrap stylesheet -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Fonts and Color -->
    <link rel="stylesheet" href="css/fonts.css">
    <link rel="stylesheet" href="css/palette.css">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Page CSS -->
    <link rel="stylesheet" href="css/employee-login-page.css">
  </head>

  <body class="bg-purple-taupe">
    <div class="banner-login-section">
      <div class="banner-container row no-gutters">
        <div class="banner-login col-md-4 offset-md-4 col-sm-12 match">
          <h1 class=" lora text-xs-center">fb</h1>

          <form action="employeeProfile" method="POST" class="col-md-10">
            <div class="form-group">
              <input type="text" class="form-control" name="username" placeholder="Username">
            </div>

            <div class="form-group">
              <input type="password" class="form-control" name="password" placeholder="Password">
            </div>

            <div class="form-group">
              <div class="g-recaptcha recaptScale" data-sitekey="6LfaaBQUAAAAAI_LCKV34P9v9lnTbqQPc6Vjcyf5"></div>
            </div>
              
            <div class="form-group">
              <button type="submit" class="btn btn-block btn-success">Login</button>
            </div>

          </form>

        </div>
      </div>
    </div>

  </body>
  <script src="js/jquery.min.js" charset="utf-8"></script>
  <script src="js/tether.min.js" charset="utf-8"></script>
  <script src="js/bootstrap.min.js" charset="utf-8"></script>
  <script src="https://www.google.com/recaptcha/api.js" async defer></script>
  
  <script type="text/javascript">
    $(document).ready(function() {

      $("form").submit(function(event) {
          
          if(grecaptcha.getResponse() === "") {
              //event.preventDefault();
              //alert("Kindly check the recaptcha and try again.");
          }
          grecaptcha.reset();
      });
    });
  </script>
</html>

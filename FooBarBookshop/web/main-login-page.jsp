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
    <link rel="stylesheet" href="css/main-login-page.css">
  </head>

  <body>
    <div class="banner-login-section">
      <div class="banner-container bg-eton-blue row no-gutters">
        <div class="banner-login col-md-4 col-sm-12 match">
          <h1 class="text-purple-taupe lora text-xs-center">fb</h1>

          <form action="login" method="POST" class="col-md-8">
            <div class="form-group">
              <input type="text" class="form-control" name="username" placeholder="Username">
            </div>

            <div class="form-group">
              <input type="password" class="form-control" name="password" placeholder="Password">
            </div>

            <div class="form-group">
              <button type="submit" class="btn btn-block bg-purple-navy">Login</button>
            </div>

            <div class="form-group">
               <button onclick="window.location='registration.jsp';" type="button" class="btn btn-block bg-purple-taupe">Register</button>
            </div>
          </form>

        </div>

        <div class="banner-tag col-md-8 hidden-sm-down match">
          <img src="img/open-book.svg" alt="" class="" style="height: 160px">
          <h1 class="text-purple-taupe tagline">Foobar, the original.</h1>
        </div>
      </div>
    </div>

    <div class="description-section mt-3">
      <div class="container">
        <h1 class="text-xs-center text-purple-taupe lora mb-3">Foobar Bookshop</h1>

        <div class="row">
          <div class="col-sm-4">
            <div class="card">
              <div class="card-block">
                <i class="fa fa-search d-block text-eton-blue"></i>
                <h1 class="card-title text-purple-taupe mt-3">Search</h1>
                <h6 class="card-subtitle mb-2 text-muted">Browse wide collection of products</h6>
              </div>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="card">
              <div class="card-block d-block">
                <i class="fa fa-shopping-cart d-block text-eton-blue"></i>
                <h1 class="card-title text-purple-taupe mt-3">Add</h1>
                <h6 class="card-subtitle mb-2 text-muted">Add it to your cart!</h6>
              </div>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="card">
              <div class="card-block d-block">
                <i class="fa fa-usd d-block text-eton-blue"></i>
                <h1 class="card-title text-purple-taupe mt-3">Buy</h1>
                <h6 class="card-subtitle mb-2 text-muted">Buy our products via credit cards</h6>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="product-section">

    </div>
  </body>
  <script src="js/jquery.min.js" charset="utf-8"></script>
  <script src="js/tether.min.js" charset="utf-8"></script>
  <script src="js/bootstrap.min.js" charset="utf-8"></script>

  <script src="js/matchHeight.min.js" charset="utf-8"></script>

  <script type="text/javascript">


    var taglines = [
      "Connect with Foobar",
      "Leggo my Foobar!",
      "Foobar gives it really good.",
      "World's finest Foobar.",
      "Good to know Foobar",
      "Truly Foobar",
      "hhmmmmm... Foobar",
      "Gotta Lotta Foobar",
      "A Foobar is Forever",
      "Foobar, the original",
      "See the world with Foobar",
      "People like Foobar",
      "It's your Foobar!",
      "Foobar, the clever way",
      "Dial down the Foobar",
      "Give that man a Foobar",
      "I'm Lovin' Foobar",
      "God made Foobar",
      "Foobar for president.",
      "Foobartastic!",
      "I like the Foobar in You.",
      "The Foobar universe",
      "Foobar, you know you want it",
      "OMG, it's a Foobar",
      "It's nothing but Foobar",
      "Foobar the clear choice",
      "The Foobar Effect",
      "Foobar - forget the rest.",
      "The original Foobar",
      "Say it with Foobar",
      "Foobar is a winner",
      "The Foobar spirit",
      "Foobar, stay in touch",
      "To Foobar, or not to Foobar",
      "Foobar - The Revolution"
    ];

    $(document).ready(function() {
      $('.match').matchHeight();
      $('.card').matchHeight();

      var num = Math.floor(Math.random() * taglines.length - 1);
      $('.tagline').text(taglines[num]);
    });
  </script>
</html>

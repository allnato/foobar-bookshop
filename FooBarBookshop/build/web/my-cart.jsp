<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Foobar | Item</title>
    <link rel="icon" type="image/png" sizes="96x96" href="img/favicon-96x96.png">

    <!-- Bootstrap stylesheet -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap-lumen.min.css">
    <!-- Fonts and Color -->
    <link rel="stylesheet" href="css/fonts.css">
    <link rel="stylesheet" href="css/palette.css">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <!-- Page CSS -->
    <link rel="stylesheet" href="css/my-cart.css">
    <link rel="stylesheet" href="css/navigation.css">
  </head>

  <body>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navigation" aria-expanded="false">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
          <a href="catalog" class="navbar-brand">fb</a>
        </div>
        <div class="collapse navbar-collapse" id="navigation">
          <ul class="nav navbar-nav">
            <li class="active"><a href="catalog">Catalog</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <li>
              <a href="cart">
                      My Cart <i class="fa fa-shopping-cart fa-lg"></i> <span class="badge badge-danger">2</span>
                    </a>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="true">
                      My Profile <i class="fa fa-user-circle fa-lg"></i> <span class="caret"></span>
                    </a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="profile">My Profile</a></li>
                <li><a href="#">Purchase History</a></li>
                <li class="divider"></li>
                <li><a href="#">Logout</a></li>
              </ul>
            </li>
          </ul>

        </div>
      </div>
    </nav>
    <!-- Wrapper -->
    <div class="wrapper">
      <div class="cart-container container">
        <div class="panel panel-info">
          <div class="panel-body">
            <div class="cart-table col-sm-7">
              <div class="panel panel-info">
                <div class="panel-heading lato">
                  <h4 class="cart-label lato">
                    <i class="fa fa-shopping-cart fa-lg"></i>
                    &nbsp;
                    My Cart
                  </h4>
                </div>
                <div class="panel-body">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr class="item-row">
                        <td>Humpty Dumpty</td>
                        <td>60.00 PHP</td>
                        <td>x3</td>
                        <td>180.00 PHP</td>
                        <td><button type="button" class="removeRowBTN btn btn-sm"><i class="fa fa-times"></i></button></td>
                      </tr>
                      <tr class="item-row">
                        <td>Adventure Time</td>
                        <td>120.00 PHP</td>
                        <td>x4</td>
                        <td>480.00 PHP</td>
                        <td><button type="button" class="removeRowBTN btn btn-sm"><i class="fa fa-times"></i></button></td>
                      </tr>
                      <tr class="total-table">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="total-amount"></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="item-checkout col-sm-5">
              <h2 class="checkout-label lora">
                <i class="fa fa-credit-card"></i>
                &nbsp;
                Checkout
              </h2>
              <hr>
              <h3 class="lato">Total: <span class="total-amount">680.00 PHP</span></h3>
              <!-- Form -->
              <div class="complete-payment form-group">
                <form action="" method="POST">
                  <button class="btn btn-danger btn-block lato form-control" type="submit">
                    <i class="fa fa-check fa-lg"></i>
                    &nbsp;
                    Complete Payment
                  </button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
  <div class="modal fade" id="removeItemModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <div class="modal-title">
            Remove this Item?
          </div>
        </div>
        <div class="modal-body">
          <table class="table table-responsive table-striped">
            <thead>
              <tr>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="name-modal"></td>
                <td class="price-modal"></td>
                <td class="quantity-modal"></td>
                <td class="total-modal"></td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="modal-footer">
          <div class="row">
            <div class="col-sm-6 text-right">
              <button class="btn btn-lg btn-success text-right" id="keepActionBTN" data-dismiss="modal">Keep</button>
            </div>
            <div class="col-sm-6 text-left">
              <button class="btn btn-lg btn-danger" id="removeActionBTN">Remove</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="js/jquery.min.js" charset="utf-8"></script>
  <script src="bootstrap/js/bootstrap.min.js" charset="utf-8"></script>
  <script src="js/jquery.noty.packaged.min.js" charset="utf-8"></script>
  <script src="js/my-cart.js" charset="utf-8"></script>

</html>

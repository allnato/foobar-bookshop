<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Foobar | Manage Products</title>
    <link rel="icon" type="image/png" sizes="96x96" href="img/favicon-96x96.png">

    <!-- Bootstrap stylesheet -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap-lumen.min.css">
    <!-- Fonts and Color -->
    <link rel="stylesheet" href="css/fonts.css">
    <link rel="stylesheet" href="css/palette.css">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Bootstrap Datepicker -->
    <link rel="stylesheet" href="css/bootstrap-datepicker3.min.css">
    <!-- Boostrap Table CSS -->
    <link rel="stylesheet" href="css/bootstrap-table.min.css">
    <!-- Page CSS -->
    <link rel="stylesheet" href="css/pm.css">
    <link rel="stylesheet" href="css/navigation.css">
  </head>

  <body>
    <div class="wrapper">
      <nav class="navbar navbar-default">
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
              <li class="active"><a href="#">Manage Products</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="true">
                        My Profile <i class="fa fa-user-circle fa-lg"></i> <span class="caret"></span>
                      </a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="employeeProfile">My Profile</a></li>
                  <li class="divider"></li>
                  <li><a href="employeeLogout">Logout</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <div class="pm-container container">
        <div class="row">
          <div class="col-sm-12">
            <h2 class="lato category">Category: Books</h2>
          </div>
        </div>
        <div class="row">
          <!-- Add Product Container -->
          <div class="add-product-container col-sm-3">
            <div class="panel-add-product panel panel-default">
              <div class="panel-heading lato"></div>
              <div class="panel-body">
                <div class="form-group">
                  <button class="btn btn-block btn-lg lato" id="addProdBtn"
                    data-toggle="modal" data-target="#addProdModal"
                  >
                    <span class="pull-left"><i class="fa fa-shopping-bag"></i></span>
                    Add a new Product
                  </button>
                </div>
              </div>
            </div>
          </div>
          <div class="table-product-container col-sm-9">
            <div class="panel-table panel panel-warning">
              <div class="panel-heading">
                Manage Products
              </div>
              <div class="panel-body">
                <table class="table table-striped table-reponsive" id="productTable">
                  <thead>
                    <tr>
                      <th data-field="productID" data-sortable="true">ID</th>
                      <th data-field="productName" data-sortable="true">Name</th>
                      <th data-field="productPrice" data-sortable="true">Price</th>
                      <th data-field="productDesc" data-formatter="descriptionFormatter" data-sortable="true">Description</th>
                      <th data-field="action" data-formatter="actionFormatter"
                      data-events="actionEvents" data-align="center">Action</th>
                    </tr>
                  </thead>
                  <tbody id="table-body">
                    <tr>
                      <td>3</td>
                      <td>Humpty Dumpty</td>
                      <td>65.00</td>
                      <td>A Classic Folklore</td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>

  <!-- Add Product Modal -->
  <div class="modal fade" id="addProdModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <!--  Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title lato">Add a new Product</h4>
        </div>
        <!-- Form -->
        <form action="#" method="POST" id="addProdForm">
          <div class="modal-body">
            <!-- Name -->
            <div class="form-group has-feedback">
              <label for="productName">Product Name</label>
              <input name="productName" type="text" class="form-control" id="productName"
              placeholder="Enter the name of the Product">
            </div>
            <!-- Price -->
            <div class="form-group has-feedback">
              <label for="productPrice">Product Price</label>
              <input name="productPrice" type="number" class="form-control" id="productPrice"
              placeholder="Price must be a positive Integer">
            </div>
            <!-- Description -->
            <div class="form-group has-feedback">
              <label for="productDesc">Product Description <em class="text-info">-Optional</em></label>
              <textarea name="productDesc" class="form-control" id="productDesc" rows="5"
              placeholder="Enter a detailed description of the product"></textarea>
            </div>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-success">Add New Product</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </form>

      </div>
    </div>
  </div>
  <div class="modal fade" id="confirmModal" role="dialog" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <div class="modal-title">
            <h3 class="lato text-center">Remove this Product</h3>
          </div>
        </div>
        <div class="modal-body">
          <table class="table table-responsive table-striped">
            <tbody>
              <tr>
                <td class="text-center">ID</td>
                <td class="text-center productIDModal">1</td>
              </tr>
              <tr>
                <td class="text-center">Name</td>
                <td class="text-center productNameModal">Humpty Dumpty</td>
              </tr>
              <tr>
                <td class="text-center">Price</td>
                <td class="text-center productPriceModal">Price</td>
              </tr>
            </tbody>
          </table>
          <div class="row">
            <div class="col-sm-6 text-right">
              <button class="btn btn-lg btn-success text-right" id="confirmActionBTN">Confirm</button>
            </div>
            <div class="col-sm-6">
              <button class="btn btn-lg btn-danger" id="declineActionBTN" data-dismiss="modal">Decline</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="js/jquery.min.js" charset="utf-8"></script>
  <script src="bootstrap/js/bootstrap.min.js" charset="utf-8"></script>
  <script src="js/bootstrap-table.min.js" charset="utf-8"></script>
  <script src="js/bootstrap-table-resizable.js" charset="utf-8"></script>
  <script src="js/colResizable-1.6.min.js" charset="utf-8"></script>

  <script src="js/bootstrap-datepicker.min.js" charset="utf-8"></script>
  <script src="js/jquery.validate.min.js" charset="utf-8"></script>
  <script src="js/pm-manage-products.js" charset="utf-8"></script>

</html>

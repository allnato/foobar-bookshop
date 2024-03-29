<!DOCTYPE html>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>

<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Foobar | Catalog</title>
    <link rel="icon" type="image/png" sizes="96x96" href="img/favicon-96x96.png">

    <!-- Bootstrap stylesheet -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap-lumen.min.css">
    <!-- Fonts and Color -->
    <link rel="stylesheet" href="css/fonts.css">
    <link rel="stylesheet" href="css/palette.css">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Page CSS -->
    <link rel="stylesheet" href="css/catalog.css">
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
                <li><a href="logout">Logout</a></li>
              </ul>
            </li>
          </ul>

        </div>
      </div>
    </nav>
    <!-- Wrapper -->
    <div class="wrapper">
      <!-- Search Bar -->
      <div class="search container">
        <div class="form-group">
          <div class="input-group">
            <div class="input-group-addon"><i class="fa fa-search fa-2x"></i></div>
            <input type="text" class="form-control input-lg" placeholder="Can't find your product? Search it Here!">
            <div class="input-group-addon">
              <button type="button" name="button" class="btn btn-default">Search</button>
            </div>
          </div>
        </div>
      </div>

      <!-- Content -->
      <div class="content container-fluid">
        <!-- Content Filter -->
        <div class="row content-filter-action">
          <!-- Filter Actions -->
          <div class="col-sm-10 col-sm-offset-2">
            <div class="filter-actions pull-right">
              <!-- Search Items -->
              <div class="form-inline" style="display: inline">
                <div class="form-group">
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-eye fa-lg"></i></span>
                    <input type="text" class="form-control" id="search-filter" placeholder="Filter the products">
                  </div>
                </div>
              </div>
              <!-- Sort by Type -->
              <div class="dropdown" style="display: inline">
                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                  <span class="sort-type-text">Name</span>
                </button>
                <ul class="dropdown-menu">
                  <li><a href="#"><span class="sort-type">Name</span></a></li>
                  <li><a href="#"><span class="sort-type">Reviews</span></a></li>
                  <li><a href="#"><span class="sort-type">Price</span></a></li>
                  <li><a href="#"><span class="sort-type">Date</span></a></li>
                </ul>
              </div>
              <!-- Sort by Direction -->
              <button class="btn btn-default text-right sort-direction-btn" type="button">
                <i class="sort-direction-logo fa fa-long-arrow-up fa-lg"></i> <span class="sort-direction-text">Ascending</span>
              </button>
            </div>
          </div>
        </div>
        <!-- Main Content -->
        <div class="row content-main">
          <!-- Sidebar Navigation -->
          <div class="sidebar-nav col-sm-2">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h2 class="category-label lato text-center">
                  <i class="fa fa-list"></i> Categories
                </h2>
              </div>
              <div class="category-container panel-body">
                <div class="category-list list-group">
                  <a href="#" class="list-group-item active">All</a>
                  <a href="#" class="list-group-item">Books</a>
                  <a href="#" class="list-group-item">Magazines</a>
                  <a href="#" class="list-group-item">CDs & DVDs</a>
                  <a href="#" class="list-group-item">Furnitures</a>
                </div>
              </div>
            </div>
          </div>
          <!-- Main Catalog -->
          <div class="item-container col-sm-10">
            <div class="row catalog-items">
              <c:forEach var="product" items="${products}" >
              <!-- Item Card -->
              <div class="item-card col-md-3 col-sm-4 col-xs-12 ">
                <div class="panel panel-primary">
                  <!-- Heading -->
                  <div class="panel-heading"></div>
                  <div class="panel-body">
                    <div class="item-detail col-md-12">
                      <!-- Product Name -->
                      <h3 class="item-name text-center lora">${product.name}</h3>
                      <hr>
                      <!-- Product Price -->
                      <h3 class="text-center lato text-success">PHP <span class="item-price">${product.price}</span></h3>
                      <!-- Product Reviews -->
                      <h3 class="text-center lato"><small><span class="item-review">${product.noOfReviews}</span> Reviews</small></h3>

                      <!-- Product Action -->
                      <div class="item-forms">
                        <div class="form-group">
                          <form action="item" method="GET" action="item">
                            <button class="form-control item-btn-info btn btn-primary btn-sm btn-block lato">
                              <i class="fa fa-info-circle fa-lg"></i>
                              View product info
                            </button>
                              <input type="hidden" class="productID" value="${product.productID}" name="productID">
                          </form>
                        </div>
                        <div class="row">
                            <form method="GET" action="additem">
                          <div class="item-quantity form-group col-lg-3">
                            <input type="number" name="productQuantity" class="form-control text-center lato productQuantity" min="1" value="1">
                            <input type="hidden" name="productID" value="${product.productID}">
                          </div>
                          <div class="item-btn-cart form-group col-lg-9">
                            <button type="submit" class="btn btn-warning btn-block addCartBTN">
                              <i class="fa fa-cart-plus"></i>
                              Add to Cart
                            </button>
                          </div>
                            </form>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="panel-footer text-center">
                    <small class="item-update">Last Update: 03/24/2017</small>
                  </div>
                </div>
              </div>
              </c:forEach>

          </div>
        </div>
      </div>

    </div>
  </body>

  <script src="js/jquery.min.js" charset="utf-8"></script>
  <script src="bootstrap/js/bootstrap.min.js" charset="utf-8"></script>
  <script src="js/jquery.sticky-kit.min.js" charset="utf-8"></script>
  <script src="js/isotope.pkgd.min.js" charset="utf-8"></script>
  <script src="js/catalog.js" charset="utf-8"></script>

</html>

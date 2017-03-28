<!DOCTYPE html>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- Page CSS -->
    <link rel="stylesheet" href="css/product-item.css">
    <link rel="stylesheet" href="css/navigation.css">
    <link rel="stylesheet" href="css/animate.css">
    <style media="screen">
      textarea{
        resize:none;
      }
    </style>
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
          <a href="#" class="navbar-brand">fb</a>
        </div>
        <div class="collapse navbar-collapse" id="navigation">
          <ul class="nav navbar-nav">
            <li class="active"><a href="">Catalog</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <li>
              <a href="#">
                      My Cart <i class="fa fa-shopping-cart fa-lg"></i> <span class="badge badge-danger">2</span>
                    </a>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="true">
                      My Profile <i class="fa fa-user-circle fa-lg"></i> <span class="caret"></span>
                    </a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">My Profile</a></li>
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
      <div class="item-container container">
        <div class="item-information-container row">
          <ul class="breadcrumb">
            <li><a href="#">Catalog</a></li>
            <li class="active">Item</li>
          </ul>
          <div class="panel panel-info">
            <div class="panel-body">
              <div class="item-content row">
                <div class="item-img col-xs-6">
                  <img class="img-responsive img-thumbnail" src="img/item-placeholder-fat.png" alt="placeholder-img">
                </div>
                <div class="item-information col-xs-6">
                  <h1 class="item-name lora">${product.name}</h1>
                  <div class="item-sub-info">
                    <h4 class="item-update-label lato">Last Update: <span class="item-update">12/21/2017</span></h4> &emsp;
                    <h4 class="item-review-label text-info lato"><span class="item-review">4</span> Reviews</h4>
                  </div>
                  <hr>
                  <h3 class="item-price-label lora">Price: <span class="item-price lato">${product.price} PHP</span></h3>
                  <h3 class="item-type-label lora">Type: <span class="item-type lato">Book</span></h3>
                  <p class="item-information-label lora">Item Information</p>
                  <p class="item-information lato">
                    ${product.description}
                  </p>
                  <!-- Forms -->
                  <div class="item-form">
                    <form action="" method="POST">
                      <div class="col-sm-6 col-sm-offset-3">
                        <div class="form-group">
                          <label for="input-quantity">Quantity</label>
                          <input type="number" id="input-quantity" class="form-control lato text-center" value="1" min="1">
                        </div>
                        <button class="btn btn-warning item-add-cart-btn lato btn-block" type="submit">
                          <i class="fa fa-cart-plus fa-lg"></i>&emsp;Add to Cart
                        </button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="item-reviews-container row">
          <div class="panel panel-info">
            <div class="panel-body">
              <div class="row">
                <div class="col-sm-6">
                  <h3 class="item-reviews-label lora">Item Reviews</h3>
                </div>
                <div class="col-sm-6">
                  <button class="btn btn-success pull-right btn-lg lato"
                   data-toggle="modal" data-target="#reviewModal">Add a Review</button>
                </div>
              </div>
              <hr>
              <div class="list-group">
                <c:forEach var="reviews" items="${reviews}">
                <a  class="list-group-item">
                  <h4 class="list-group-item-heading">${reviews.name}</h4>
                  <br/>
                  <p class="list-group-item-text">
                    Date: ${reviews.dateReviewed}
                    
                    ${reviews.message}
                  </p>
                </a>
                </c:forEach>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </body>
  <div class="modal fade" id="reviewModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <div class="modal-title">Write a Review</div>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <textarea required name="name" rows="8" class="form-control lato textarea" placeholder="Write your Review Here"></textarea>
          </div>
        </div>
        <div class="modal-footer">
          <div class="row">
            <div class="col-sm-6 text-right">
              <button class="btn btn-lg btn-success text-right" id="postActionBTN">Post</button>
            </div>
            <div class="col-sm-6 text-left">
              <button class="btn btn-lg btn-danger" id="cancelActionBTN" data-dismiss="modal">Cancel</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="js/jquery.min.js" charset="utf-8"></script>
  <script src="bootstrap/js/bootstrap.min.js" charset="utf-8"></script>
  <script src="js/jquery.noty.packaged.min.js" charset="utf-8"></script>
  <script src="js/product-item.js" charset="utf-8"></script>

</html>

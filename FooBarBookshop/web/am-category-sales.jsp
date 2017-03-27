<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Foobar | Total Sales</title>
    <link rel="icon" type="image/png" sizes="96x96" href="img/favicon-96x96.png">

    <!-- Bootstrap stylesheet -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap-lumen.min.css">
    <!-- Fonts and Color -->
    <link rel="stylesheet" href="css/fonts.css">
    <link rel="stylesheet" href="css/palette.css">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Chartist -->
    <link rel="stylesheet" href="css/chartist.min.css">
    <!-- Boostrap Table CSS -->
    <link rel="stylesheet" href="css/bootstrap-table.min.css">
    <!-- Page CSS -->
    <link rel="stylesheet" href="css/am.css">
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
              <li><a href="#">Product Sales</a></li>
              <li class="active"><a href="">Category Sales</a></li>
              <li><a href="salesTotal">Total Sales</a></li>
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
      <div class="category-sales-container container">
        <div class="row">
          <div class="top-purchased-table-container col-sm-4">
            <div class="purchased-table-panel panel panel-info">
              <div class="panel-heading">
                <h3>Top 5 Category: 2017</h3>
              </div>
              <div class="panel-body">
                <table class="table table-responsive table-striped">
                  <thead>
                    <tr>
                      <th>Category Name</th>
                      <th># of Purchases</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>Books</td>
                      <td>42</td>
                    </tr>
                    <tr>
                      <td>Magazines</td>
                      <td>31</td>
                    </tr>
                    <tr>
                      <td>CDs & DVDs</td>
                      <td>20</td>
                    </tr>
                    <tr>
                      <td>Furniture</td>
                      <td>9</td>
                    </tr>
                    <tr>
                      <td>Clothes</td>
                      <td>3</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="top-purchased-graph-container col-sm-8">
            <div class="top-purchased-graph panel panel-success">
              <div class="panel-heading">
                <h1 class="lato"> Top 5 Categories: 2017</h1>
              </div>
              <div class="panel-body">
                <div class="purchased-graph"></div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="category-table-panel panel panel-warning">
            <div class="panel-heading">
              <h1 class="lato">Yearly Category Purchase</h1>
            </div>
            <div class="panel-body">
              <table class="table table-responsive table-striped" id="categoryTable">
                <thead>
                  <tr>
                    <th data-sortable="true">Cateogry Name</th>
                    <th data-sortable="true">2017</th>
                    <th data-sortable="true">2016</th>
                    <th data-sortable="true">2015</th>
                    <th data-sortable="true">2014</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>Books</td>
                    <td>100</td>
                    <td>150</td>
                    <td>160</td>
                    <td>170</td>
                  </tr>
                  <tr>
                    <td>Clothing</td>
                    <td>200</td>
                    <td>250</td>
                    <td>260</td>
                    <td>270</td>
                  </tr>
                  <tr>
                    <td>Magazines</td>
                    <td>300</td>
                    <td>350</td>
                    <td>360</td>
                    <td>370</td>
                  </tr>
                  <tr>
                    <td>CDs & DVDs</td>
                    <td>400</td>
                    <td>450</td>
                    <td>460</td>
                    <td>470</td>
                  </tr>
                  <tr>
                    <td>Furniture</td>
                    <td>500</td>
                    <td>550</td>
                    <td>560</td>
                    <td>570</td>
                  </tr>
                  <tr>
                    <td>Kitchenware</td>
                    <td>160</td>
                    <td>61</td>
                    <td>62</td>
                    <td>63</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>

  <script src="js/jquery.min.js" charset="utf-8"></script>
  <script src="bootstrap/js/bootstrap.min.js" charset="utf-8"></script>

  <script src="js/chartist.min.js" charset="utf-8"></script>
  <script src="js/jquery.validate.min.js" charset="utf-8"></script>
  <script src="js/am-total-sales.js" charset="utf-8"></script>

  <script src="js/bootstrap-table.min.js" charset="utf-8"></script>
  <script src="js/bootstrap-table-resizable.js" charset="utf-8"></script>
  <script src="js/colResizable-1.6.min.js" charset="utf-8"></script>


  <script type="text/javascript">
  var $table = $('#categoryTable');
    $(document).ready(function() {
      new Chartist.Bar('.purchased-graph', {
          labels: ['Books', 'Magazine', 'CDs & DVDs', 'Furniture', 'Clothing'],
          series: [42,31,20,9,3]
        }, {
          distributeSeries: true,
          height: '250px'
      });

      $(document).ready(function() {
        $table.bootstrapTable({
          classes: 'table table-reponsive table-striped table-no-bordered',
          smartDisplay: true,
          showToggle: true,
          showColumns: true,
          minimumCountColumns: 3,
          pagination: true,
          onlyInfoPagination: false,
          search: true,
          toolbar: '.table-toolbar',
          toolbarAlign: 'right',
          pageSize: 10,
          formatShowingRows: function(pageFrom, pageTo, totalRows) {

          },
          formatRecordsPerPage: function(pageNumber) {

          },
          formatDetailPagination: function(totalRows) {
            return ;
          },
          onClickRow: function(row, $element){
          },
        });
      });
    });
  </script>
</html>

<!DOCTYPE html>
<html>


  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Foobar | Admin</title>
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
    <link rel="stylesheet" href="css/admin.css">
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
              <li class="active"><a href="#">Manage Locked Accounts</a></li>
              <li><a href="adminManage">Manage Managers</a></li>
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
      <div class="admin-container container">
        <div class="row">
          <div class="col-sm-12">
            <div class="panel panel-warning">
              <div class="panel-heading">
                Manage Account Lockup
              </div>
              <div class="panel-body">
                <table class="table table-striped table-reponsive" id="userTable">
                  <thead>
                    <tr>
                      <th data-field = "userID" data-sortable="true">User ID</th>
                      <th data-field = "accountType" data-sortable="true">Account Type</th>
                      <th data-field = "accountName" data-sortable="true">Account Name</th>
                      <th data-field = "lastLogin" data-sortable="true">Last Login</th>
                      <th data-field = "status" data-sortable="true" data-align="center" data-cell-style="cellStyle">Status</th>
                      <th data-formatter="actionFormatter" data-events="lockEvents" data-align="center">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>15</td>
                      <td>Product Manager</td>
                      <td>Lloyd, Kirsten S.</td>
                      <td>12/04/2016</td>
                      <td>Locked</td>
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

    <div class="modal fade" id="confirmModal" role="dialog" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <div class="modal-title">
              <h3 class="lato text-center">Lock this Account</h3>
            </div>
          </div>
          <div class="modal-body">
            <table class="table table-responsive table-striped">
              <tbody>
                <tr>
                  <td class="text-center">ID</td>
                  <td class="text-center userIDModal">2</td>
                </tr>
                <tr>
                  <td class="text-center">Name</td>
                  <td class="text-center userNameModal">Nato, Allendale</td>
                </tr>
                <tr>
                  <td class="text-center">Type</td>
                  <td class="text-center userTypeModal">Customer</td>
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

  </body>
  <script src="js/jquery.min.js" charset="utf-8"></script>
  <script src="bootstrap/js/bootstrap.min.js" charset="utf-8"></script>
  <script src="js/bootstrap-table.min.js" charset="utf-8"></script>
  <script src="js/bootstrap-table-resizable.js" charset="utf-8"></script>
  <script src="js/colResizable-1.6.min.js" charset="utf-8"></script>

  <script src="js/bootstrap-datepicker.min.js" charset="utf-8"></script>
  <script src="js/jquery.validate.min.js" charset="utf-8"></script>
  <script src="js/admin-lock-accounts.js" charset="utf-8"></script>

  <script type="text/javascript">


  </script>
</html>

<!DOCTYPE html>
<html>

  <head>
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
              <li><a href="">Manage Locked Accounts</a></li>
              <li class="active"><a href="">Manage Managers</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="true">
                        My Profile <i class="fa fa-user-circle fa-lg"></i> <span class="caret"></span>
                      </a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">My Profile</a></li>
                  <li class="divider"></li>
                  <li><a href="#">Logout</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <div class="admin-container container">
        <div class="row">
          <div class="add-managers-container col-sm-3">
            <div class="panel panel-success">
              <div class="panel-heading">
                Add Managers
              </div>
              <div class="panel-body">
                <div class="form-group">
                  <button class="btn btn-block lato btn-lg" id="addPMbtn"
                  data-toggle="modal" data-target="#addMngrModal"><span class="pull-left"><i class="fa fa-plus"></i></span>Add Product Manager</button>
                </div>
                <div class="form-group">
                  <button class="btn btn-block lato btn-lg " id="addSMbtn"
                  data-toggle="modal" data-target="#addMngrModal"><span class="pull-left"><i class="fa fa-plus"></i></span>Add Sales Manager</button>
                </div>
              </div>
            </div>
          </div>
          <!-- Product Manager -->
          <div class="view-managers-container col-sm-9">
            <div class="panel panel-warning">
              <div class="panel-heading">
                Product Manager List
              </div>
              <div class="panel-body">
                <table  class="table table-striped table-reponsive" id="PMtable">
                  <thead>
                    <tr>
                      <th data-field="PMid" data-sortable="true">Employee ID</th>
                      <th data-field="PMfirstName" data-sortable="true">Last Name</th>
                      <th data-field="PMlastName" data-sortable="true">First Name</th>
                      <th data-field="PMinCharge" data-sortable="true">Product In-Charge</th>
                      <th data-field="PMlastLogin" data-sortable="true">Last Login</th>
                      <th data-field="PMaction" data-formatter="actionFormatter"
                      data-events="PMactionEvents" data-align="center">Action</th>
                    </tr>
                  </thead>
                  <tbody id="PMtable-body">
                    <tr>
                    	<td>1</td>
                    	<td>Cooley</td>
                    	<td>Yen</td>
                    	<td>lectus</td>
                    	<td>15/11/2017</td>
                      <td></td>
                    </tr>
                    <tr>
                    	<td>2</td>
                    	<td>Huff</td>
                    	<td>Irene</td>
                    	<td>ipsum.</td>
                    	<td>01/11/2016</td>
                      <td></td>
                    </tr>
                    <tr>
                    	<td>3</td>
                    	<td>Stephenson</td>
                    	<td>Ivana</td>
                    	<td>vestibulum</td>
                    	<td>20/09/2017</td>
                      <td></td>
                    </tr>
                    <tr>
                    	<td>4</td>
                    	<td>Cortez</td>
                    	<td>Kiona</td>
                    	<td>tortor.</td>
                    	<td>20/05/2016</td>
                      <td></td>
                    </tr>
                    <tr>
                    	<td>5</td>
                    	<td>Wheeler</td>
                    	<td>Vivian</td>
                    	<td>amet</td>
                    	<td>27/09/2017</td>
                      <td></td>
                    </tr>
                    <tr>
                    	<td>6</td>
                    	<td>Reeves</td>
                    	<td>Evan</td>
                    	<td>urna.</td>
                    	<td>09/02/2018</td>
                      <td></td>
                    </tr>
                    <tr>
                    	<td>7</td>
                    	<td>Mitchell</td>
                    	<td>Myra</td>
                    	<td>amet,</td>
                    	<td>09/12/2016</td>
                      <td></td>
                    </tr>
                    <tr>
                    	<td>8</td>
                    	<td>Fisher</td>
                    	<td>Malcolm</td>
                    	<td>consectetuer</td>
                    	<td>12/07/2017</td>
                      <td></td>
                    </tr>
                    <tr>
                    	<td>9</td>
                    	<td>Barron</td>
                    	<td>Winter</td>
                    	<td>nulla.</td>
                    	<td>10/12/2016</td>
                      <td></td>
                    </tr>
                    <tr>
                    	<td>10</td>
                    	<td>Snow</td>
                    	<td>Imani</td>
                    	<td>erat.</td>
                    	<td>22/12/2016</td>
                      <td></td>
                    </tr>
                    <tr>
                    	<td>11</td>
                    	<td>Rocha</td>
                    	<td>Jasmine</td>
                    	<td>tincidunt</td>
                    	<td>11/12/2017</td>
                      <td></td>
                    </tr>
                    <tr>
                    	<td>12</td>
                    	<td>Osborne</td>
                    	<td>Ian</td>
                    	<td>Fusce</td>
                    	<td>31/10/2017</td>
                      <td></td>
                    </tr>
                    <tr>
                    	<td>13</td>
                    	<td>Huffman</td>
                    	<td>Stewart</td>
                    	<td>Vivamus</td>
                    	<td>17/10/2017</td>
                      <td></td>
                    </tr>
                    <tr>
                    	<td>14</td>
                    	<td>Hopper</td>
                    	<td>Keith</td>
                    	<td>aliquam</td>
                    	<td>14/06/2017</td>
                      <td></td>
                    </tr>
                    <tr>
                    	<td>15</td>
                    	<td>Lancaster</td>
                    	<td>Jack</td>
                    	<td>turpis</td>
                    	<td>26/05/2016</td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <!-- Sales Manager -->
        <div class="row">
          <div class="view-managers-container col-sm-9 col-sm-offset-3">
            <div class="panel panel-warning">
              <div class="panel-heading">
                Sales Manager List
              </div>
              <div class="panel-body">
                <table  class="table table-striped table-responsive" id="SMtable">
                  <thead>
                    <tr>
                      <th data-field="SMid" data-sortable="true" >Employee ID</th>
                      <th data-field="SMlastName" data-sortable="true">Last Name</th>
                      <th data-field="SMfirstName" data-sortable="true">First Name</th>
                      <th data-field="SMlastLogin" data-sortable="true">Last Login</th>
                      <th data-field="SMaction" data-formatter="actionFormatter"
                      data-events="SMactionEvents" data-align="center">Action</th>
                    </tr>
                  </thead>
                  <tbody id="SMtable-body">
                    <tr>
                      <td>003</td>
                      <td>Lucio</td>
                      <td>Antonio</td>
                      <td>12/21/2014</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>006</td>
                      <td>Pakistan</td>
                      <td>Joe</td>
                      <td>09/21/2016</td>
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

    <!-- Add new Manager Modal -->
    <div class="modal fade" id="addMngrModal" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Add New Product Manager</h4>
          </div>
            <form class="creditForm" method="post" id="addMngrForm">
              <div class="modal-body">
                <div class="tab-pane" id="personal-information">
                  <h3>Personal Info</h3>
                  <hr>
                  <div class="row fullname">
                    <!-- First Name -->
                    <div class="firstName form-group has-feedback col-sm-5">
                      <label for="first_name">First Name</label>
                      <input type="text" name="firstName" class="form-control" id="first_name">
                    </div>
                    <!-- Last Name -->
                    <div class="lastName form-group has-feedback col-sm-5">
                      <label for="last_name">Last Name</label>
                      <input type="text" name="lastName" class="form-control" id="last_name">
                    </div>
                    <!-- Middle Initial -->
                    <div class="middleInitial form-group has-feedback col-sm-2">
                      <label for="middle_initial">M.I.</label>
                      <input type="text" name="middleInitial" class="form-control" id="middle_initial" maxlength="1">
                    </div>
                  </div>
                  <!-- Birth Date -->
                  <div class="birthDate form-group has-feedback">
                    <label for="birth_date">Birth Date</label>
                    <input type="text" name="birthDate" class="form-control" id="birth_date" placeholder="mm-dd-yyyy">
                  </div>
                  <h3>Account Info</h3>
                  <hr>
                  <div class="row logincred">
                    <!-- Email -->
                    <div class="email form-group has-feedback col-sm-6">
                      <label for="email">Email</label>
                      <input type="email" name="email" class="form-control" id="email" placeholder="youremail@mail.com">
                    </div>
                    <!-- Username -->
                    <div class="username form-group has-feedback col-sm-6">
                      <label for="username">Username</label>
                      <input type="text" name="username" class="form-control" id="username" placeholder="Minimum of 4 characters">
                    </div>
                  </div>

                  <!-- Password -->
                  <div class="password form-group has-feedback">
                    <label for="password">Password</label>
                    <input type="password" name="password" class="form-control" id="password" placeholder="Minimum of 8 charcters">
                  </div>
                  <!-- Password:re -->
                  <div class="password form-group has-feedback">
                    <label for="confirm_password">Confirm password</label>
                    <input type="password" class="form-control" name="password_confirm" id="confirm_password" placeholder="Retype password">
                  </div>

                  <div class="product-type form-group has-feedback" id="product-type-container">
                    <label for="product-type">Product In-Charge</label>
                    <input type="text" class="form-control" name="product_type" id="product-type" placeholder="Product Type">
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="submit" class="btn btn-success">Add New Manager</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </form>
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
  <script src="js/admin-add-managers.js" charset="utf-8"></script>

  <script type="text/javascript">
    $('#addPMbtn').click(function() {
      $('.modal-title').text('Add New Product Manager');
      $('#addMngrForm').attr('action', 'addNewPM');
      $('#product-type-container').css('display', 'block');
    });

    $('#addSMbtn').click(function() {
      $('.modal-title').text('Add New Sales Manager');
      $('#addMngrForm').attr('action', 'addNewAM');
      $('#product-type-container').css('display', 'none');
    });


  </script>
</html>

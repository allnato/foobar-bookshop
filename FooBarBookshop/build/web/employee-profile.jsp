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
    <link rel="stylesheet" href="css/employee.profile.css">
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
              <li class=""><a href="employeeHome">Back to Dashboard</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="true">
                        My Profile <i class="fa fa-user-circle fa-lg"></i> <span class="caret"></span>
                      </a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">My Profile</a></li>
                  <li class="divider"></li>
                  <li><a href="employeeLogout">Logout</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <div class="profile-container container">
        <div class="panel panel-info">
          <div class="panel-body">
            <div class="row">
              <div class="profile-picture-container col-sm-5">
                <div class="profile-picture">
                  <img src="img/speckles.png" class="img-responsive" alt="profile-picture">
                </div>
                <div>
                  <h2 class="profile-fullname lato text-center">Joe Pakistan</h2>
                  <h2 class="profile-username text-center lato"><small>JoePak</small></h2>
                  <h2 class="profile-username text-center lato"><small>Product Manager: Books</small></h2>
                  <div class="action-buttons well">
                    <div class="form-group">
                      <button class="btn btn-default form-control btn-block" id="edit-profile-btn">
                        <i class="fa fa-user fa-lg"></i>
                        &nbsp;
                        Edit Profile
                      </button>
                    </div>
                    <div class="form-group">
                      <button class="btn btn-default form-control btn-block"
                      data-toggle="modal" data-target="#changePasswordModal">
                        <i class="fa fa-key fa-lg"></i>
                        &nbsp;
                        Change Password
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="profile-information-container col-sm-7">
                <form action="" method="POST" id="personal-information-form">
                  <h3>Personal Info</h3>
                  <hr>
                  <div class="row fullname">
                    <!-- First Name -->
                    <div class="firstName form-group has-feedback col-sm-5">
                      <label for="first_name">First Name</label>
                      <input disabled type="text" name="firstName" class="form-control" id="first_name">
                    </div>
                    <!-- Last Name -->
                    <div class="lastName form-group has-feedback col-sm-5">
                      <label for="last_name">Last Name</label>
                      <input disabled type="text" name="lastName" class="form-control" id="last_name">
                    </div>
                    <!-- Middle Initial -->
                    <div class="middleInitial form-group has-feedback col-sm-2">
                      <label for="middle_initial">M.I.</label>
                      <input disabled type="text" name="middleInitial" class="form-control" id="middle_initial" maxlength="1">
                    </div>
                  </div>
                  <!-- Birth Date -->
                  <div class="birthDate form-group has-feedback">
                    <label for="birth_date">Birth Date</label>
                    <input disabled type="text" name="birthDate" class="form-control" id="birth_date" placeholder="mm-dd-yyyy">
                  </div>
                  <h3>Account Info</h3>
                  <hr>
                  <div class="row logincred">
                    <!-- Email -->
                    <div class="email form-group has-feedback col-sm-6">
                      <label for="email">Email</label>
                      <input disabled type="email" name="email" class="form-control" id="email" placeholder="youremail@mail.com">
                    </div>
                    <!-- Username -->
                    <div class="username form-group has-feedback col-sm-6">
                      <label for="username">Username</label>
                      <input disabled type="text" name="username" class="form-control" id="username" placeholder="Minimum of 4 characters">
                    </div>
                  </div>
                  <hr>
                  <div class="form-group">
                    <button type="submit" disabled class="btn btn-default btn-block btn-lg lato " name="button">Save Changes</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
  <!-- Change Password Modal -->
  <div class="modal fade" id="changePasswordModal" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Change Your Password</h4>
        </div>
        <form action="" method="POST" id="password-form">
          <div class="modal-body">
              <div class="form-group has-feedback">
                <label for="currentPassword"><i class="fa fa-key"></i> Current Password</label>
                <input type="password" class="form-control" id="currentPassword" name="old_password">
              </div>
              <div class="form-group has-feedback">
                <label for="newPassword"><i class="fa fa-unlock"></i> New Password</label>
                <input type="password" class="form-control" id="newPassword" name="password">
              </div>
              <div class="form-group has-feedback">
                <label for="newPasswordAgain"><i class="fa fa-lock"></i> Retype new Passowrd</label>
                <input type="password" class="form-control" id="newPasswordAgain" name="password_confirm">
              </div>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-success" >Save changes</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
      </form>
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
  <script src="js/employee-profile.js" charset="utf-8"></script>

</html>

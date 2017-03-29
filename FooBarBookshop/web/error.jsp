<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isErrorPage="true" import="java.io.*" %>
<%@ page import="edu.secprog.security.*" %>
<%@ page import="javax.servlet.*" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="refresh" content="7; url=/SECPROG_MP/home">
  <title>Foobar | Error</title>
  <link rel="icon" type="image/png" sizes="96x96" href="img/favicon-96x96.png">

  <!-- Bootstrap stylesheet -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap-lumen.min.css">
  <!-- Fonts and Color -->
  <link rel="stylesheet" href="css/fonts.css">
  <link rel="stylesheet" href="css/palette.css">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <!-- Page CSS -->
  <link rel="stylesheet" href="css/navigation.css">
  <link rel="stylesheet" href="css/error.css">

</head>

<body>
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
          <li><a href="/SECPROG_MP/home">Home</a></li>
          <li><a href="">About us</a></li>
        </ul>
        <p class="navbar-text navbar-right">Made with <i class="fa fa-heart"></i> by foobar</p>
      </div>
    </div>
  </nav>
  <div class="wrapper container">
    <div class="row">

      <h1 class="lato error-message">Oops, Something went wrong :(</h1>
      <h1><small>Please try again later or contact the web administrator.
              You will be redirected to the homepage in a few seconds.</small></h1>
      <hr>
      <h2 class="lato error-code">Error Code: <span><%=response.getStatus()%></span></h2>
      <h2 class="lato error-code-message">
             <%!
                String errMsg;
             %>
             <%
                errMsg = Audit.getHttpStatusMsg(response.getStatus());
              
                if (errMsg != null) {
                %><small><%=errMsg%></small>
                <% }
                else if ((errMsg = request.getAttribute("javax.servlet.error.message").toString()) != null
                            && !errMsg.trim().equals("")) {
                %><small><%=errMsg%></small>
                <% }
                else {
                    try {
                        errMsg = exception.getMessage();
                    }
                    catch (Exception e) {
                        errMsg = "Internal Server Error";
                    }
                    finally {
                %><small><%=errMsg%></small>
                 <% }
                 }
             %>
      </h2>
    </div>
  </div>
</body>
<script src="js/jquery.min.js" charset="utf-8"></script>
<script src="bootstrap/js/bootstrap.min.js" charset="utf-8"></script>
</html>

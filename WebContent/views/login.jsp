<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html lang="de">
<head>
	<%@include file="../includes/head.jsp"%>
    <meta charset="utf-8">
    <title>Login</title>
    
</head>
<body>
<ul class="nav">
  <li class="nav-item">
    <a class="nav-link active" href="../views/Start/Hilfeseite.jsp">Anleitung</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="../views/Start/impressum.jsp">Impressum</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="../views/Start/team.jsp">Entwickerteam</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
  </li>
</ul>
<div class="container">
    <div class="row justify-content-center">
        <div class="login col-sm-10 col-md-8 col-lg-6">
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="Enter email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Enter Password" required>
            </div>
            <button class="btn btn-primary" id="submit_login">Login</button>
            <div class="invalid-feedback" id="invalid-login" style="display: none">
                Email or password wrong.
            </div>
            <hr>
            <p>Haven't got an account? <a href="/register">Register here</a></p>
        </div>
    </div>
</div>

<script>
    var requestUri = "<%= request.getParameter("requestUri") == null ? "" : request.getParameter("requestUri") %>";
</script>
<script src="../js/scripts.js"></script>
<script src="../js/sha256.min.js"></script>
<script src="../js/login.js"></script>
</body>
</html>
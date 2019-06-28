<%@ page import="controller.SessionController" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="de">
<head>
    <meta charset="utf-8">
    <title>Register</title>
    <%@include file="../includes/head.jsp" %>
</head>
<body>
<%SessionController.checkLogin(request, response);%>
<div class="container">
    <div class="row justify-content-center">
        <div class="register col-sm-10 col-md-8 col-lg-6">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" name="email" id="username" placeholder="Enter your first and last name" required>
            </div>
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="Enter email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Enter Password" required>
            </div>
            <label for="handle">Handle</label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="handle-prepend">@</span>
                </div>
                <input type="text" class="form-control" name="handle" id="handle" placeholder="Choose Handle" aria-describedby="handle-prepend" required>
                <div class="invalid-feedback" id="invalid-handle" style="display: none">
                    Handle is already taken
                </div>
            </div>
            <input type="hidden" id="password-new" value="">
            <input type="hidden" id="password-new-wdh" value="">
            <button class="btn btn-primary" id="submit_register">Register</button>
            <hr>
            <p>Already got an account? <a href="/login">Log-in here</a></p>
        </div>
    </div>
</div>

<script src="../js/scripts.js"></script>
<script src="../js/sha256.min.js"></script>
<script src="../js/validations.js"></script>
<script src="../js/register.js"></script>
</body>
</html>
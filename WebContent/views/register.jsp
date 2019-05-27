<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html lang="de">
<head>
    <meta charset="utf-8">
    <title>Register</title>
    <%@include file="../includes/head.jsp"%>
</head>
<body>
<form>
    <input type="text" id="username">
    <input type="text" id="email">
    <input type="text" id="password">
    <input type="button" name="submit" id="submit_register" value="Registrieren">
</form>

<script src="../js/scripts.js"></script>
<script src="../js/sha256.min.js"></script>
<script src="../js/login.js"></script>
</body>
</html>
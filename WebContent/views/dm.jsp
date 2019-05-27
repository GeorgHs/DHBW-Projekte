<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="controller.SessionController" %>
<html lang="de">
<head>
    <meta charset="utf-8">
    <title>Messages</title>
    <%@include file="../includes/head.jsp"%>
</head>
<body>
<%SessionController.checkLogin(request, response);%>
<%@include file="/includes/navbar.jsp"%>

<script src="../js/scripts.js"></script>
<script src="../js/websockets.js"></script>
</body>
</html>
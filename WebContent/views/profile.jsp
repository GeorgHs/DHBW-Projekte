<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="controller.SessionController" %>
<html lang="de">
<head>
    <meta charset="utf-8">
    <title>Profile</title>
    <%@include file="../includes/head.jsp"%>
</head>
<body>
<%SessionController.checkLogin(request, response);%>
<%@include file="/includes/navbar.jsp"%>
<jsp:useBean id="Profil" class="models.Profile" />
<jsp:useBean id="Post" class="models.Post" />

<jsp:setProperty name="Profil" property="id" value="1"/>
<jsp:setProperty name="Post" property="id" value="0"/>
<jsp:getProperty name="Profil" property="id"/>
<jsp:getProperty name="Profil" property="email"/>
<jsp:getProperty name="Profil" property="username"/>

<script src="../js/scripts.js"></script>
<script src="../js/websockets.js"></script>
</body>
</html>
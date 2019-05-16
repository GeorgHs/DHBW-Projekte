<%@ page import="org.apache.catalina.connector.RequestFacade" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html lang="de">
<head>
    <meta charset="utf-8">
    <title>Profile</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<%@include file="./WEB-INF/includes/navbar.jsp"%>
<jsp:useBean id="Profil" class="models.Profile" />

<jsp:getProperty name="Profil" property="user_id"/>
<jsp:getProperty name="Profil" property="email"/>
<jsp:getProperty name="Profil" property="username"/>

</body>
</html>
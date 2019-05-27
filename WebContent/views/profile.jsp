<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="controller.SessionController" %>
<html lang="de">
<head>
    <meta charset="utf-8">
    <title>Profile</title>
    <%@include file="../includes/head.jsp" %>
</head>
<body>
<%SessionController.checkLogin(request, response);%>
<%@include file="/includes/navbar.jsp" %>
<jsp:useBean id="Profil" class="models.Profile"/>
<jsp:useBean id="Post" class="models.Post"/>

<%SessionController.getTokenId(request, response);%>
<jsp:setProperty name="Profil" property="id" value="${tokenID}"/>
<!--<jsp:getProperty name="Profil" property="id"/>-->
<div class="profile-heading container-fluid p-0">
    <div class="title-picture-wrapper" style="background: url('data:image/jpeg;base64,${Profil.titlePicture}');">
        <div class="edit-picture-btn">
            <a href="#"><i class="fas fa-pen"></i></a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-2">
            <div class="profile-image-wrapper">

                <img src="data:image/png;base64, ${Profil.profilePicture}" width="150px"
                     height="150px">
                <div class="edit-picture-btn">
                    <a href="#"><i class="fas fa-pen"></i></a>
                </div>
            </div>
        </div>
        <div class="col-md-7">
            <div style="height: 75px;">
                <jsp:getProperty name="Profil" property="email"/>
                <jsp:getProperty name="Profil" property="username"/>
            </div>
            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Schreib etwas..." aria-label="Username"
                       aria-describedby="basic-addon1">
                <div class="input-group-prepend">
                    <button class="input-group-text" onclick="alert('hi');"><i class="fas fa-camera"></i></button>
                </div>
            </div>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>


<script src="../js/scripts.js"></script>
<script src="../js/websockets.js"></script>
</body>
</html>
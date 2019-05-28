<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="controller.SessionController" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<jsp:setProperty name="Profil" property="id" value="${id}"/>
<!--<jsp:getProperty name="Profil" property="id"/>-->
<div class="profile-heading container-fluid p-0">
    <div class="title-picture-wrapper" style="background: url('data:image/jpeg;base64,${Profil.titlePicture}');">
        <c:if test="${edit}">
            <div class="edit-picture-btn">
                <a href="#"><i class="fas fa-pen"></i></a>
            </div>
        </c:if>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-2">
            <div class="profile-image-wrapper">

                <img src="data:image/png;base64, ${Profil.profilePicture}" width="150px"
                     height="150px">
                <c:if test="${edit}">
                    <div class="edit-picture-btn">
                        <a data-toggle="modal" data-target="#profileModal"><i class="fas fa-pen"></i></a>
                    </div>
                </c:if>
            </div>
        </div>
        <div class="col-md-7">
            <div style="height: 75px;">
                <jsp:getProperty name="Profil" property="email"/>
                <jsp:getProperty name="Profil" property="username"/>
            </div>
            <c:if test="${edit}">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Schreib etwas..." aria-label="Username"
                           aria-describedby="basic-addon1">
                    <div class="input-group-prepend">
                        <button class="input-group-text" onclick="alert('hi');"><i class="fas fa-camera"></i></button>
                    </div>
                </div>
            </c:if>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="profileModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="profileModalTitle">Profilbild bearbeiten</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input name="profilePicture" type="file">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="convertToBase64()">Save changes</button>
            </div>
        </div>
    </div>
</div>

<script src="../js/profile.js"></script>
<script src="../js/scripts.js"></script>
<script src="../js/websockets.js"></script>
</body>
</html>
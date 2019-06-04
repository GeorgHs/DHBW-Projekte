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

<div class="profile-heading container-fluid p-0">
    <div class="title-picture-wrapper" style="background: url('data:image;base64,${Profil.titlePicture}');">
        <c:if test="${edit}">
            <div class="edit-picture-btn">
                <a data-toggle="modal" data-target="#profileModal" onclick="changeModal('title')"><i class="fas fa-pen"></i></a>
            </div>
        </c:if>
    </div>
    <div class="row">
        <div class="col-md-2">


        </div>
        <div class="col-md-2" style="max-width: 150px;">
            <div class="profile-image-wrapper">
                <img src="data:image;base64, ${Profil.profilePicture}" width="150px"
                     height="150px" class="profile-image">
                <c:if test="${edit}">
                    <div class="edit-picture-btn">
                        <a data-toggle="modal" data-target="#profileModal" onclick="changeModal('profile')"><i class="fas fa-pen"></i></a>
                    </div>
                </c:if>
            </div>
            <jsp:getProperty name="Profil" property="email"/>
            <jsp:getProperty name="Profil" property="username"/>
        </div>
        <div class="col-md-7">
            <ul class="nav nav-tabs" id="profileTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link card-button active" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">
                        <h2>Posts</h2>
                        <h3>34</h3>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link card-button" id="subscriptions-tab" data-toggle="tab" href="#subscriptions" role="tab" aria-controls="subsrciptions" aria-selected="false">
                        <h2>Folge ich</h2>
                        <h3>${Profil.subscriptions.size()}</h3>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link card-button" id="follower-tab" data-toggle="tab" href="#follower" role="tab" aria-controls="follower" aria-selected="false">
                        <h2>Follower</h2>
                        <h3>${Profil.follower.size()}</h3>
                    </a>
                </li>
            </ul>

            <div class="tab-content" id="profileTabContent">
                <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
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
                <div class="tab-pane fade" id="subscriptions" role="tabpanel" aria-labelledby="subscriptions-tab">
                    <c:forEach items="${Profil.subscriptions}" var="subscriptions">
                        ${subscriptions.handle}

                    </c:forEach>
                    asdfasdf
                </div>
                <div class="tab-pane fade" id="follower" role="tabpanel" aria-labelledby="follower-tab">
                    <c:forEach items="${Profil.follower}" var="follow">
                        ${follow.handle}

                    </c:forEach>
                </div>
            </div>
            <!--<div class="profile-card card">
                <div class="card-body">
                    <div class="card-button active">
                        <h2>Posts</h2>
                        <h3>34</h3>
                    </div>
                    <div class="card-button">
                        <h2>Folge ich</h2>
                        <h3>${Profil.subscriptions.size()}</h3>
                    </div>
                    <div class="card-button">
                        <h2>Follower</h2>
                        <h3>${Profil.follower.size()}</h3>
                    </div>


                </div>


            </div>-->

        </div>
        <div class="col-md-1">
            <c:choose>
                <c:when test="${edit}">
                    <button class="btn">Profil bearbeiten</button>
                </c:when>
                <c:otherwise>
                    <c:choose>
                    <c:when test="${Profil.isFollowing(14)}">
                        <button class="btn float-right" onclick="follow(${Profil.id})">Nicht mehr Folgen</button>
                    </c:when>
                        <c:otherwise>
                            <button class="btn float-right" onclick="follow(${Profil.id})">Folgen</button>
                        </c:otherwise>
                    </c:choose>

                </c:otherwise>
            </c:choose>
        </div>
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
                <button type="button" class="btn btn-secondary cancel" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary send" onclick="convertToBase64('profilepicture')">Save changes</button>
            </div>
        </div>
    </div>
</div>

<script src="../js/profile.js"></script>
<script src="../js/scripts.js"></script>
<script src="../js/websockets.js"></script>
</body>
</html>
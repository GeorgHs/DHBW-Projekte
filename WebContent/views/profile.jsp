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
            <p class="h5"><jsp:getProperty name="Profil" property="username"/>
                <span class="handle">@<jsp:getProperty name="Profil" property="handle"/></span>
            </p>
        </div>
        <div class="col-md-7">
            <!--Profil Nav-->
            <ul class="nav nav-tabs" id="profileTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link card-button active" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">
                        <h2>Posts</h2>
                        <h3>${Profil.posts.size()}</h3>
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
            <!--Tab Content-->
            <div class="tab-content" id="profileTabContent">
                <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                <!--Posts Tab-->
                    <c:if test="${edit}">
                        <jsp:include page="../includes/create-post.jsp" />
                    </c:if>
                    <c:forEach items="${Profil.posts}" var="post">
                        <jsp:include page="../includes/post.jsp">
                            <jsp:param name="user_id" value="${post.user.id}"/>
                            <jsp:param name="user_username" value="${post.user.username}"/>
                            <jsp:param name="user_handle" value="${post.user.handle}"/>
                            <jsp:param name="user_profilePicture" value="${post.user.profilePicture}"/>
                            <jsp:param name="text" value="${post.text}"/>
                            <jsp:param name="media" value="${post.media}"/>
                            <jsp:param name="media_media" value="${post.media.media}"/>
                            <jsp:param name="created_at_pretty" value="${post.created_at_pretty}"/>
                        </jsp:include>
                    </c:forEach>

                </div>
                <div class="tab-pane fade" id="subscriptions" role="tabpanel" aria-labelledby="subscriptions-tab">
                    <!--Subscriptions Tab-->
                    <div class="row">
                    <c:forEach items="${Profil.subscriptions}" var="subscriptions">
                        <div class="col-md-6">
                        <jsp:include page="../includes/profile-card.jsp">
                            <jsp:param name="id" value="${subscriptions.id}"/>
                            <jsp:param name="username" value="${subscriptions.username}"/>
                            <jsp:param name="profilePicture" value="${subscriptions.profilePicture}"/>
                            <jsp:param name="titlePicture" value="${subscriptions.titlePicture}"/>
                            <jsp:param name="handle" value="${subscriptions.handle}"/>
                        </jsp:include>
                        </div>
                    </c:forEach>
                    </div>
                </div>
                <div class="tab-pane fade" id="follower" role="tabpanel" aria-labelledby="follower-tab">
                   <!--Follower Tab-->
                    <div class="row">
                        <c:forEach items="${Profil.follower}" var="follow">
                            <div class="col-md-6">
                                <jsp:include page="../includes/profile-card.jsp">
                                    <jsp:param name="id" value="${follow.id}"/>
                                    <jsp:param name="username" value="${follow.username}"/>
                                    <jsp:param name="profilePicture" value="${follow.profilePicture}"/>
                                    <jsp:param name="titlePicture" value="${follow.titlePicture}"/>
                                    <jsp:param name="handle" value="${follow.handle}"/>
                                </jsp:include>
                           </div>
                        </c:forEach>
                   </div>
                </div>
            </div>
        </div>
        <div class="col-md-1">
            <!--Edit Profile oder Follow/Unfollow Button-->
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

<!--Modal zum ändern von den Bildern -->
<jsp:include page="../includes/change-picture-modal.jsp"></jsp:include>


<script src="../js/profile.js"></script>
<script src="../js/create-post.js"></script>
<script src="../js/scripts.js"></script>
<script src="../js/websockets.js"></script>
</body>
</html>
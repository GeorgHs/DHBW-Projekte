<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="controller.SessionController" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="de">
<head>
    <meta charset="utf-8">
    <title>Feed</title>
    <%@include file="../includes/head.jsp" %>
</head>
<body>
<%SessionController.checkLogin(request, response);%>
<%@include file="/includes/navbar.jsp" %>

<jsp:useBean id="feed" class="models.Feed"/>
<jsp:useBean id="profile" class="models.Profile"/>
<jsp:setProperty name="feed" property="user" value="${id}"/>
<jsp:setProperty name="profile" property="id" value="${id}"/>
<div class="container_fluid">
    <div class="row">
        <div class="feed_left col-sm-3">
            <!--<div class="profile_card card search_result" style="width: 100%;">
                <img class="card-img-top" src="data:image;base64,${profile.titlePicture}">
                <img class="profile-image" src="data:image;base64,${profile.profilePicture}">
                <div class="card-body">
                    <a href="/profile/${profile.id}">${profile.username} <span class="handle">@${profile.handle}</span></a>
                </div>
            </div>-->
            <jsp:include page="../includes/profile-card.jsp">
                <jsp:param name="id" value="${profile.id}"/>
                <jsp:param name="username" value="${profile.username}"/>
                <jsp:param name="profilePicture" value="${profile.profilePicture}"/>
                <jsp:param name="titlePicture" value="${profile.titlePicture}"/>
                <jsp:param name="handle" value="${profile.handle}"/>
            </jsp:include>
        </div>
        <div class="feed_center col-sm-6">
            <c:forEach items="${feed.posts}" var="post">
                <jsp:include page="../includes/post.jsp">
                    <jsp:param name="user_id" value="${post.user.id}"/>
                    <jsp:param name="user_username" value="${post.user.username}"/>
                    <jsp:param name="user_handle" value="${post.user.handle}"/>
                    <jsp:param name="user_profilePicture" value="${post.user.profilePicture}"/>
                    <jsp:param name="text" value="${post.text}"/>
                    <jsp:param name="media" value="${post.media}"/>
                    <jsp:param name="media_media" value="${post.media.media}"/>
                </jsp:include>
            </c:forEach>
        </div>
        <div class="feed_right col-sm-3">
            <p>Insert DMs here</p>
        </div>
    </div>
</div>
<script src="/js/scripts.js"></script>
<script src="/js/websockets.js"></script>
<script src="/js/feed.js"></script>
</body>
</html>
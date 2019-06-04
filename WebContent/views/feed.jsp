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
            <div class="profile_card card search_result" style="width: 100%;">
                <img class="card-img-top" src="data:image;base64,${profile.titlePicture}">
                <img class="profile-image" src="data:image;base64,${profile.profilePicture}">
                <div class="card-body">
                    <a href="/profile/${profile.id}">${profile.username} <span class="handle">@${profile.handle}</span></a>
                </div>
            </div>
        </div>
        <div class="feed_center col-sm-6">
            <c:forEach items="${feed.posts}" var="post">
                <div class="post card">
                    <div class="card-body container">
                        <div class="row">
                            <div class="post-avatar col-md-2 col-xl-1"><img src="data:image;base64,${post.user.profilePicture}">
                            </div>
                            <div class="col-md-10 col-xl-11">
                                <div class="post-header"><a href="/profile/${post.user.id}"><b>${post.user.username}</b><span class="handle">@${post.user.handle}</span></a></div>
                                <div class="post-content">
                                    <p>${post.text}</p>
                                    <c:if test="${post.media != null}"><img src="data:image;base64,${post.media.media}" class="card-img-top"></c:if>
                                </div>
                                <div class="post-footer">
                                    <i class="fas fa-heart" style="color: lightgray;"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
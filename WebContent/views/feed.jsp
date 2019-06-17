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
<jsp:useBean id="profile" class="models.Profile"/>
<jsp:setProperty name="profile" property="id" value="${id}"/>
<div class="container_fluid">
    <div class="row">
        <div class="feed_left col-sm-3">
            <jsp:include page="../includes/profile-card.jsp">
                <jsp:param name="id" value="${profile.id}"/>
                <jsp:param name="username" value="${profile.username}"/>
                <jsp:param name="profilePicture" value="${profile.profilePicture}"/>
                <jsp:param name="titlePicture" value="${profile.titlePicture}"/>
                <jsp:param name="handle" value="${profile.handle}"/>
            </jsp:include>
        </div>
        <div class="feed_center col-sm-6">
            <jsp:include page="../includes/create-post.jsp"/>
            <div class="btn btn-sm centered" id="load_more" onclick="loadMorePosts(10)">
                <div class="spinner-border" style="display: none" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
                <p>Load more</p>
            </div>
        </div>
        <div class="feed_right col-sm-3">
            <jsp:include page="/includes/dm_chatbox.jsp"/>
        </div>
    </div>
</div>
<script src="/js/scripts.js"></script>
<script src="/js/websockets.js"></script>
<script src="/js/feed.js"></script>
<script src="/js/create-post.js"></script>
</body>
</html>
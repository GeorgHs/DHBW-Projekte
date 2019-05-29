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

<jsp:useBean id="Feed" class="models.Feed"/>
<jsp:setProperty name="Feed" property="user" value="${id}"/>
<c:forEach items="${Feed.posts}" var="post">
    <div class="post card">
        <div class="card-body container">
            <div class="row">
                <div class="post-avatar col-2">
                    <img src="data:image;base64,${post.user.profilePicture}">
                </div>
                <div class="col-10">
                    <div class="post-header"><b>${post.user.username}</b><span class="handle">@${post.user.handle}</span></div>
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

<script src="/js/scripts.js"></script>
<script src="/js/websockets.js"></script>
<script src="/js/feed.js"></script>
</body>
</html>
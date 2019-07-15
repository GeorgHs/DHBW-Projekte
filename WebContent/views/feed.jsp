<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="de">
<head>
    <meta charset="utf-8">
    <title>Feed</title>
    <%@include file="../includes/head.jsp" %>
</head>
<body>
<jsp:useBean id="profile" class="models.Profile"/>
<jsp:include page="/includes/navbar.jsp"/>
<jsp:setProperty name="profile" property="id" value="${id}"/>
<div class="container_fluid">
    <div class="row">
        <div class="feed_left col-sm-3 d-none d-lg-block">
                <jsp:include page="../includes/profile-card.jsp">
                    <jsp:param name="id" value="${profile.id}"/>
                    <jsp:param name="username" value="${profile.username}"/>
                    <jsp:param name="profilePicture" value="${profile.profilePicture}"/>
                    <jsp:param name="titlePicture" value="${profile.titlePicture}"/>
                    <jsp:param name="handle" value="${profile.handle}"/>
                </jsp:include>

                <div class="suggestions card">
                    <div class="card-head">
                        <p class="h5 m-2">Vorschläge für dich:</p>
                    </div>
                    <div class="btn btn-sm centered" id="load_more_sug" onclick="loadMoreSuggestions(3)">
                        <div class="spinner-border" style="display: none" role="status">
                            <span class="sr-only">Loading...</span>
                        </div>
                        <p>Load more</p>
                    </div>
                </div>
        </div>
        <div class="feed_center col-sm-6">
            <jsp:include page="../includes/create-post.jsp"/>
            <div id="feed">
                <div class="btn btn-sm centered" id="load_more" onclick="loadMorePosts(10)">
                    <div class="spinner-border" style="display: none" role="status">
                        <span class="sr-only">Loading...</span>
                    </div>
                    <p>Load more</p>
                </div>
            </div>
        </div>
        <div class="feed_right col-sm-6 col-md-6 col-lg-3">
            <jsp:include page="/includes/dm_chatbox.jsp">
                <jsp:param name="id" value="${id}"/>
            </jsp:include>
        </div>
    </div>
</div>
<script src="../js/scripts.js"></script>
<script src="../js/websockets.js"></script>
<script src="../js/feed.js"></script>
</body>
</html>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="de">
<head>
    <meta charset="utf-8">
    <title>Profile</title>
    <%@include file="../includes/head.jsp" %>
</head>
<body>
<%@include file="/includes/navbar.jsp" %>
<jsp:useBean id="Profile" class="models.Profile"/>
<jsp:useBean id="Post" class="models.Post"/>

<jsp:setProperty name="Profile" property="id" value="${id}"/>

<div class="profile-heading container-fluid p-0">
    <div class="title-picture-wrapper" style="background: url('data:image;base64,${Profile.titlePicture}');">
        <c:if test="${edit}">
            <div class="edit-picture-btn">
                <a data-toggle="modal" data-target="#profileModal" onclick="changeModal('title')"><i
                        class="fas fa-pen"></i></a>
            </div>
        </c:if>
    </div>
    <div class="row">

        <div class="col-md-2">

        </div>
        <div class="col-md-2" style="max-width: 150px;">
            <div class="profile-image-wrapper">
                <img src="data:image;base64, ${Profile.profilePicture}" width="150px"
                     height="150px" class="profile-image">
                <c:if test="${edit}">
                    <div class="edit-picture-btn">
                        <a data-toggle="modal" data-target="#profileModal" onclick="changeModal('profile')"><i
                                class="fas fa-pen"></i></a>
                    </div>
                </c:if>
            </div>
            <jsp:getProperty name="Profile" property="email"/>
            <jsp:getProperty name="Profile" property="username"/>
        </div>
        <div class="col-md-7">
            <ul class="nav nav-tabs" id="profileTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link card-button active" id="posts-tab" data-toggle="tab" href="#posts" role="tab"
                       aria-controls="posts" aria-selected="true">
                        <h2>Posts</h2>
                        <h3>${Profile.posts.size()}</h3>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link card-button" id="subscriptions-tab" data-toggle="tab" href="#subscriptions"
                       role="tab" aria-controls="subsrciptions" aria-selected="false">
                        <h2>Folge ich</h2>
                        <h3>${Profile.subscriptions.size()}</h3>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link card-button" id="follower-tab" data-toggle="tab" href="#follower" role="tab"
                       aria-controls="follower" aria-selected="false">
                        <h2>Follower</h2>
                        <h3>${Profile.follower.size()}</h3>
                    </a>
                </li>
                <c:choose>
                    <c:when test="${edit}">
                        <button class="btn btn-primary follow-btn" data-toggle="modal" data-target="#settingsModal">Profil bearbeiten</button>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${Profile.isFollowing(tokenId)}">
                                <button class="btn btn-primary follow-btn" onclick="follow(${Profile.id}, this)">Nicht mehr Folgen</button>
                            </c:when>
                            <c:otherwise>
                                <button class="btn btn-primary follow-btn" onclick="follow(${Profile.id}, this)">Folgen</button>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
            </ul>

            <div class="tab-content" id="profileTabContent">
                <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                    <c:if test="${edit}">
                        <jsp:include page="/includes/create-post.jsp"/>
                    </c:if>
                    <div id="feed" class="profile-posts">
                        <div class="btn btn-sm centered" id="load_more" onclick="loadMorePosts(10)">
                            <div class="spinner-border" style="display: none" role="status">
                                <span class="sr-only">Loading...</span>
                            </div>
                            <p>Load more</p>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="subscriptions" role="tabpanel" aria-labelledby="subscriptions-tab">
                    <div class="row">
                    <c:forEach items="${Profile.subscriptions}" var="subscriptions">
                        <div class="col-md-6">
                        <jsp:include page="../includes/profile-card.jsp">
                            <jsp:param name="id" value="${subscriptions.id}"/>
                            <jsp:param name="username" value="${subscriptions.username}"/>
                            <jsp:param name="profilePicture" value="${subscriptions.profilePicture}"/>
                            <jsp:param name="titlePicture" value="${subscriptions.titlePicture}"/>
                            <jsp:param name="handle" value="${subscriptions.handle}"/>
                            <jsp:param name="follower" value="${subscriptions.follower.size()}"/>
                            <jsp:param name="following" value="${subscriptions.subscriptions.size()}"/>
                        </jsp:include>
                        </div>
                    </c:forEach>
                    </div>
                </div>
                <div class="tab-pane fade" id="follower" role="tabpanel" aria-labelledby="follower-tab">
                   <div class="row">
                        <c:forEach items="${Profile.follower}" var="follow">
                            <div class="col-md-6">
                                <jsp:include page="../includes/profile-card.jsp">
                                    <jsp:param name="id" value="${follow.id}"/>
                                    <jsp:param name="username" value="${follow.username}"/>
                                    <jsp:param name="profilePicture" value="${follow.profilePicture}"/>
                                    <jsp:param name="titlePicture" value="${follow.titlePicture}"/>
                                    <jsp:param name="handle" value="${follow.handle}"/>
                                    <jsp:param name="follower" value="${follow.follower.size()}"/>
                                    <jsp:param name="following" value="${follow.subscriptions.size()}"/>
                                </jsp:include>
                           </div>
                        </c:forEach>
                   </div>
                </div>
            </div>

        </div>
        <div class="col-md-1">

        </div>
    </div>
</div>
<jsp:include page="../includes/change-user-settings.jsp" >
    <jsp:param name="email" value="${Profile.email}"/>
    <jsp:param name="handle" value="${Profile.handle}"/>
    <jsp:param name="username" value="${Profile.username}"/>
</jsp:include>
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
                <input id="profilePictureInput" type="file">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary cancel" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary send" onclick="convertToBase64('profilepicture')">Save
                    changes
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    var profileId = "<%= Profile.getId() %>";
</script>
<script src="../js/validations.js"></script>
<script src="../js/profile.js"></script>
<script src="../js/scripts.js"></script>
<script src="../js/websockets.js"></script>
</body>
</html>
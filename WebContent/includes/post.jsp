<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>
<div class="post card" data-id="${param.id}">
    <div class="card-body container post-body">

        <div class="row">
            <div class="post-avatar col-md-2 col-xl-1"><img src="data:image;base64,${param.user_profilePicture}">
            </div>
            <div class="col-md-10 col-xl-11">
                <div class="post-header">
                    <a href="/profile/${param.user_id}"><b>${param.user_username}</b><span
                            class="handle">@${param.user_handle}</span></a>
                    <p class="post-date">${param.created_at_pretty}</p>
                </div>
                <div class="post-content">
                    <p>${param.text}</p>
                    <c:if test="${param.media != ''}">
                        <img src="data:image;base64,${param.media_media}" class="card-img-top">
                    </c:if>
                </div>
                <div class="post-footer">
                    <c:choose>
                        <c:when test="${Post.like.size() == 0}">
                            <i class="fas fa-heart" style="color: lightgray;">0</i>
                        </c:when>
                        <c:otherwise>
                            <i class="fas fa-heart" style="color: red;">${Post.like.size()}</i>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>

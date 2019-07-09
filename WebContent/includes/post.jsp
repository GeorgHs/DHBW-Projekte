<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>
<div class="post card" >
    <div class="card-body container post-body" >
        <div class="row" data-id="${param.post_id}">
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
                        <c:when test="${Post.like.isliked == false">
                            <button class="fas fa-heart" onclick="${Post.like.isliked = true}, ${Post.like.size()}+1" style="color: gray">${Post.like.size()}</button>
                        </c:when>
                        <c:when test="${Post.like.isliked == true}"
                            <button class="fas fa-heart" onclick="${Post.like.isliked = false}, ${Post.like.size()}-1" style="color: red">${Post.like.size()}</button>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>

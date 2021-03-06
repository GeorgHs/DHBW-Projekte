<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="feed" class="models.Feed"/>
<jsp:setProperty name="feed" property="user" value="${param.id}"/>
<jsp:setProperty name="feed" property="limit" value="${param.limit}"/>
<jsp:setProperty name="feed" property="offset" value="${param.offset}"/>
<jsp:setProperty name="feed" property="current" value="${param.current}"/>

<c:choose>
    <c:when test="${feed.posts.size()>0}">
        <c:forEach items="${feed.posts}" var="post">
            <jsp:include page="../includes/post.jsp">
                <jsp:param name="post_id" value="${post.id}"/>
                <jsp:param name="user_id" value="${post.user.id}"/>
                <jsp:param name="user_username" value="${post.user.username}"/>
                <jsp:param name="user_handle" value="${post.user.handle}"/>
                <jsp:param name="user_profilePicture" value="${post.user.profilePicture}"/>
                <jsp:param name="likes" value="${post.likes.size()}"/>
                <jsp:param name="isLiked" value="${post.isLiked(param.get('current'))}"/>
                <jsp:param name="text" value="${post.text}"/>
                <jsp:param name="media" value="${post.media}"/>
                <jsp:param name="media_media" value="${post.media.media}"/>
                <jsp:param name="created_at_pretty" value="${post.created_at_pretty}"/>
            </jsp:include>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <h5>Keine Posts vorhanden folge Personen um ihre Beiträge hier zu sehen!</h5>
    </c:otherwise>
</c:choose>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="profile" class="models.Profile"/>
<jsp:setProperty name="profile" property="id" value="${param.id}"/>
<jsp:setProperty name="profile" property="limit" value="${param.limit}"/>
<jsp:setProperty name="profile" property="offset" value="${param.offset}"/>
<c:forEach items="${profile.posts}" var="post">
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

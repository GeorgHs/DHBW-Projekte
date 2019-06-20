<%--
  Created by IntelliJ IDEA.
  User: tim-o
  Date: 19.06.2019
  Time: 09:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="feed" class="models.Feed"/>
<jsp:setProperty name="feed" property="user" value="${param.id}"/>
<jsp:setProperty name="feed" property="limit" value="${param.limit}"/>
<jsp:setProperty name="feed" property="offset" value="${param.offset}"/>

<c:forEach items="${feed.suggestions}" var="suggestion">
    <jsp:include page="../includes/suggestions.jsp">
        <jsp:param name="id" value="${suggestion.id}"/>
        <jsp:param name="username" value="${suggestion.username}"/>
        <jsp:param name="handle" value="${suggestion.handle}"/>
        <jsp:param name="profilePicture" value="${suggestion.profilePicture}"/>
    </jsp:include>
</c:forEach>

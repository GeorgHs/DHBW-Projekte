<%@ page import="controller.SessionController" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Feed</title>
    <%@include file="../includes/head.jsp" %>
</head>
<body>
<%SessionController.checkLogin(request, response);%>
<%@include file="/includes/navbar.jsp" %>

<jsp:useBean id="search" class="models.Search"/>
<jsp:setProperty name="search" property="query" value="${param.q}"/>
<c:forEach items="${search.results}" var="p">
    <div class="search_result">
        <img src="data:image;base64,${p.profilePicture}">
        <a href="/profile/${p.id}">${p.username}</a>
    </div>
</c:forEach>
<c:if test="${search.no_results}">
    <p>no results found</p>
</c:if>
</body>
</html>

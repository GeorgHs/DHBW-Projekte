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
<div class="page_heading">
    <h3>Suchergebnisse:</h3>
</div>
<div class="profile_card_container">
    <c:forEach items="${search.results}" var="p">
        <jsp:include page="../includes/profile-card.jsp">
            <jsp:param name="id" value="${p.id}"/>
            <jsp:param name="username" value="${p.username}"/>
            <jsp:param name="profilePicture" value="${p.profilePicture}"/>
            <jsp:param name="titlePicture" value="${p.titlePicture}"/>
            <jsp:param name="handle" value="${p.handle}"/>
        </jsp:include>
    </c:forEach>
</div>
<c:if test="${search.no_results}">
    <p>no results found</p>
</c:if>
</body>
</html>

<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="controller.SessionController" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="de">
<head>
    <meta charset="utf-8">
    <title>Feed</title>
    <%@include file="../includes/head.jsp"%>
</head>
<body>
<%SessionController.checkLogin(request, response);%>
<%@include file="/includes/navbar.jsp"%>

<jsp:useBean id="Feed" class="models.Feed" />
<c:forEach items="${Feed.feed}" var="post">
    ${post.text}

</c:forEach>

<script src="/js/scripts.js"></script>
<script src="/js/websockets.js"></script>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="controller.SessionController" %>
<jsp:useBean id="nav_profile" class="models.Profile"/>
<jsp:setProperty name="nav_profile" property="id" value="<%= String.valueOf(SessionController.getCurrentUserId(request)) %>"/>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/feed">SocialNetwork</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <!-- Left -->
        <ul class="navbar-nav mr-auto">
            <c:if test="${nav_profile.id != -1}">
                <li class="nav-item">
                    <a class="nav-link" href="/feed">Feed</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/profile">Profil</a>
                </li>
                <li>
                    <form class="form-inline my-2 my-lg-0" action="/search">
                        <input class="form-control mr-sm-2" name="q" type="text" placeholder="'@' shows all users">
                        <button class="btn" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </form>
                </li>
            </c:if>
        </ul>
        <!-- Left -->
        <ul class="navbar-nav">
            <c:if test="${nav_profile.id != -1}">
                <li><a href="/views/help/hilfeseite.jsp" class="btn">Help</a></li>
                <li>
                    <!-- Theme Switcher -->
                    <c:choose>
                        <c:when test="${nav_profile.theme.equals('light')}">
                            <button class="btn" onclick="changeTheme('dark')" data-toggle="tooltip" data-placement="bottom" title="Switch to Dark Mode"><i class="fas fa-moon"></i></button>
                        </c:when>
                        <c:when test="${nav_profile.theme.equals('dark')}">
                            <button class="btn" onclick="changeTheme('light')" data-toggle="tooltip" data-placement="bottom" title="Switch to Light Mode"><i class="fas fa-sun"></i></button>
                        </c:when>
                    </c:choose>
                    <button class="btn btn-outline-primary" id="logoutbtn">Logout</button>
                </li>
            </c:if>
            <c:if test="${param.id == -1}">
                <li><a class="btn btn-outline-secondary" id="loginbtn" href="/login">Login</a></li>
            </c:if>
        </ul>
    </div>
</nav>
<div style="height: 70px;"></div>
<!-- Spacer for fixed navbar -->
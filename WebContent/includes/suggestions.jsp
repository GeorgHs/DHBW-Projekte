<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="suggestion-card card">

    <div class="card-body">
        <a href="/profile/${param.id}">
            <img class="suggestion-image" src="data:image;base64,${param.profilePicture}">
            <span class="handle">@${param.handle}</span>
            <span><c:out value="${param.username}"/></span>
        </a>
        <button id="follow" class="btn btn-primary" onclick="follow(${param.id}, this)">Folgen</button>
    </div>

</div>
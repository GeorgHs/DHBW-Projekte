<%--
  Created by IntelliJ IDEA.
  User: tim-o
  Date: 18.06.2019
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="suggestion-card card">

    <div class="card-body">
        <a href="/profile/${param.id}">
            <img class="suggestion-image" src="data:image;base64,${param.profilePicture}">
            <span class="handle">@${param.handle}</span>
            <span>${param.username}</span>
        </a>
        <button id="follow" class="btn btn-primary" onclick="follow(${param.id}, this)">Folgen</button>
    </div>

</div>
<%--
  Created by IntelliJ IDEA.
  User: tim-o
  Date: 05.06.2019
  Time: 09:10
  To change this template use File | Settings | File Templates.
--%>
<div class="profile_card card search_result">
    <img class="card-img-top" src="data:image;base64,${param.titlePicture}">
    <img class="profile-image" src="data:image;base64,${param.profilePicture}">
    <div class="card-body">
        <a href="/profile/${param.id}">${param.username} <span class="handle">@${param.handle}</span></a>
    </div>
</div>

<div class="profile_card card search_result">
    <img class="card-img-top" src="data:image;base64,${param.titlePicture}">
    <img class="profile-image" src="data:image;base64,${param.profilePicture}">
    <div class="card-body">
        <a href="/profile/${param.id}">${param.username} <span class="handle">@${param.handle}</span></a>
        <div style="margin-top: 10px;">
            <p style="float: left; padding-right: 5px">Followers <br><span style="font-size: 26px;">${param.follower}</span></p>
            <p style="float: left;">Following <br><span style="font-size: 26px;">${param.following}</span></p>
        </div>
    </div>
</div>

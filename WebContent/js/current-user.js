var user_id;
var username;
var handle;
var email;
var profilePicture;
$(document).ready(function() {
    $.ajax({
        type: "GET",
        url: "/api/profile/current",
        async: true
    }).done(function (data) {
        var res = data.split(",");
        user_id = res[0];
        username = res[1] ;
        handle = res[2];
        profilePicture = res[3];
        email = res[4];
    });
});

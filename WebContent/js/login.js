$(document).ready(function() {
    $("#submit_login").on("click", function() {
        $.ajax({
            type: "POST",
            url: "/api/login",
            dataType: 'json',
            async: true,
            data: "{'username': '" + $("#username").val() + "', 'password' : '" + $("#password").val() + "'}",
            statusCode: {
                200: function() {
                    location.replace("/feed");
                }
            }
        });
    })
});
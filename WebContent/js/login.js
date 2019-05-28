$(document).ready(function() {
    $("#submit_login").on("click", function() {
        $.ajax({
            type: "POST",
            url: "/api/login",
            dataType: 'json',
            async: true,
            data: "{'email': '" + $("#email").val() + "', 'password' : '" + sha256($("#password").val()) + "'}",
            statusCode: {
                200: function() {
                    location.replace("/feed");
                },
                403: function() {
                    console.log("Wrong email/password")
                }
            }
        });
    });

    $("#submit_register").on("click", function() {
        $.ajax({
            type: "POST",
            url: "/api/register",
            dataType: 'json',
            async: true,
            data: "{" +
                "'username': '" + $("#username").val() + "', " +
                "'email' : '" + $("#email").val() + "', " +
                "'password' : '" + sha256($("#password").val()) +
                "'}",
            statusCode: {
                200: function() {
                    location.replace("/feed");
                }
            }
        });
    });
});
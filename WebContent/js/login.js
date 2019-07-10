$(document).ready(function () {
    $("#submit_login").on("click", login);
    $(document).on("keydown", function (e) {
        if (e.originalEvent.key === "Enter") {
            login();
        }
    });

    function login() {
        $.ajax({
            type: "POST",
            url: "/api/login",
            dataType: 'json',
            async: true,
            data: "{'email': '" + $("#email").val() + "', 'password' : '" + sha256($("#password").val()) + "'}",
            statusCode: {
                200: function () {
                    if (requestUri.length === 0) {
                        location.replace("/feed");
                    } else {
                        location.replace(requestUri);
                    }
                },
                403: function () {
                    $("#email").addClass("is-invalid");
                    $("#password").addClass("is-invalid");
                    $("#invalid-login").css("display", "block");
                }
            }
        });
    }
});
$(document).ready(function() {
    $("#submit_register").on("click", register);
    $(document).on("keydown", function (e) {
        if (e.originalEvent.key === "Enter") {
            register();
        }
    });

    function register() {
        validateHandle();
        $.ajax({
            type: "POST",
            url: "/api/register",
            dataType: 'json',
            async: true,
            data: "{" +
                "'username': '" + $("#username").val() + "', " +
                "'email' : '" + $("#email").val() + "', " +
                "'password' : '" + sha256($("#password").val()) + "', " +
                "'handle' : '" + $("#handle").val() +
                "'}",
            statusCode: {
                200: function () {
                    location.replace("/feed");
                }
            }
        });
    }

    function validateHandle() {
        $.ajax({
            type: "POST",
            url: "/api/profile/isValidHandle",
            dataType: 'json',
            async: true,
            data: "{'handle': '" + $("#handle").val() + "'}",
            statusCode: {
                200: function (res) {
                    if (res === true) {
                        $("#handle").removeClass("is-invalid");
                        $("#handle").addClass("is-valid");
                        $("#invalid-handle").css("display", "none");
                    } else {
                        $("#handle").removeClass("is-valid");
                        $("#handle").addClass("is-invalid");
                        $("#invalid-handle").css("display", "block");
                    }
                }
            }
        });
    }
});
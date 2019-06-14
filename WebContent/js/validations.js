function validateUsername(callback) {
    $.ajax({
        type: "POST",
        url: "/api/profile/isValidUsername",
        dataType: 'json',
        async: true,
        data: "{'username': '" + $("#username").val() + "'}",
        statusCode: {
            200: function (res) {
                if (res === true) {
                    $("#username").removeClass("is-invalid");
                    $("#username").addClass("is-valid");
                    $("#invalid-username").css("display", "none");
                } else {
                    $("#username").removeClass("is-valid");
                    $("#username").addClass("is-invalid");
                    $("#invalid-username").css("display", "block");
                }
            }
        },
        success: function (response) {
            callback(response);
        }
    });
}
function validateHandle(callback) {
    $.ajax({
        type: "POST",
        url: "/api/profile/isValidHandle",
        dataType: 'json',
        async: false,
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
        },
        success: function (response) {
            callback(response);
        }
    });

}
function validateEmail(callback) {
    $.ajax({
        type: "POST",
        url: "/api/profile/isValidEmail",
        dataType: 'json',
        async: true,
        data: "{'email': '" + $("#email").val() + "'}",
        statusCode: {
            200: function (res) {
                if (res === true) {
                    $("#email").removeClass("is-invalid");
                    $("#email").addClass("is-valid");
                    $("#invalid-email").css("display", "none");
                } else {
                    $("#email").removeClass("is-valid");
                    $("#email").addClass("is-invalid");
                    $("#invalid-email").css("display", "block");
                }
            }
        },
        success: function (response) {
            callback(response);
        }
    });
}
function validatePassword(callback) {
    $.ajax({
        type: "POST",
        url: "/api/profile/isValidPassword",
        dataType: 'json',
        async: true,
        data: "{'password': '"+sha256($("#password").val())
            + "',password-new:'"+sha256($("#password-new").val())+
            "',password-new-wdh:'"+sha256($("#password-new-wdh").val())+"'}'",
        statusCode: {
            200: function (res) {
                if (res === true) {
                    $("#password").removeClass("is-invalid");
                    $("#password").addClass("is-valid");
                    $("#password-new").removeClass("is-invalid");
                    $("#password-new").addClass("is-valid");
                    $("#password-new-wdh").removeClass("is-invalid");
                    $("#password-new-wdh").addClass("is-valid");
                    $("#invalid-password").css("display", "none");
                } else {
                    $("#password").removeClass("is-valid");
                    $("#password").addClass("is-invalid");
                    $("#password-new").removeClass("is-valid");
                    $("#password-new").addClass("is-invalid");
                    $("#password-new-wdh").removeClass("is-valid");
                    $("#password-new-wdh").addClass("is-invalid");
                    $("#invalid-password").css("display", "block");
                }
            }
        },
        success: function (response) {
            callback(response);
        }
    });
}
$(document).ready(function () {
    loadMorePosts(10);
});

var offset = 0;

//Funktion, die überprüft, ob man editieren darf und fügt den Mülleimer auf die Posts ein
function checkEdit() {
    if(user_id == profileId) {
        $('.post-body .row').each(function () {
            $(this).before('<a class="delete-post" onclick="deletePost(' + $(this).data('id') + ', $(this))"><i class="fas fa-trash-alt"></i></a>');
        });
    }
}

//Bild in Base64 umwandeln
function base64(file, callback) {
    var coolFile = {};

    function readerOnload(e) {
        var base64 = btoa(e.target.result);
        coolFile.base64 = base64;
        callback(coolFile)
    }

    if (file[0].files[0] !== undefined) {
        var reader = new FileReader();
        reader.onload = readerOnload;

        var file = file[0].files[0];
        coolFile.filetype = file.type;
        coolFile.size = file.size;
        coolFile.filename = file.name;
        reader.readAsBinaryString(file);
    } else {
        callback(coolFile.base64 = "");
    }
}

//Funktion je nach Button, der geclickt wurde aufrufen
function changeModal(type) {
    if (type === 'title') {
        $('.send').attr("onclick", "convertToBase64('titlepicture')");
    } else if (type === 'profile') {
        $('.send').attr("onclick", "convertToBase64('profilepicture')");
    }
}


//Bild in Base64 umwandeln und in der Datenbank ändern
function convertToBase64(picture) {
    if ($('#profilePicture')[0].files[0] !== undefined) {
        base64($('#profilePicture'), function (data) {
            $.ajax({
                type: "POST",
                url: "/api/profile/" + picture,
                dataType: 'json',
                async: true,
                data: "{'picture': '" + data.base64 + "'}",
                statusCode: {
                    200: function () {
                        $('.cancel').click();
                        if (picture === 'titlepicture') {
                            $('.title-picture-wrapper').attr("style", "background: url('data:image; base64," + data.base64 + "'");
                        } else {
                            $('.profile-image').attr("src", "data:image; base64," + data.base64);
                        }
                    },
                    403: function () {

                    }
                }
            });
        });
    } else {
        $('.cancel').click();
    }
}


//folgen
function follow(id) {
    $.ajax({
        type: "POST",
        url: "/api/profile/follow",
        dataType: 'json',
        async: true,
        data: "{'id': '" + id + "'}",
        statusCode: {
            200: function () {
                //window.location.reload();
            },
            404: function () {
                //window.location.reload();
            }
        }
    });

}

//Funktionen um das Profil zu bearbeiten
function changeSettings() {
    if ($('#handle').val() !== handle) {
        validateHandle(function (res) {
            if (res) {
                updateHandle();
            }
        });
    }
    if ($('#username').val() !== username) {
        validateUsername(function (res) {
            if (res) {
                updateUsername();
            }
        });
    }
    if ($('#email').val() !== email) {
        validateEmail(function (res) {
            if (res) {
                updateEmail();
            }
        });
    }
    if ($('#password').val() !== '' && $('#password-new').val() !== '') {
        validatePassword(function (res) {
            if (res) {
                updatePassword();
            }
        });
    }
}

function updateUsername() {
    $.ajax({
        type: "POST",
        url: "/api/profile/updateUsername",
        dataType: 'json',
        async: true,
        data: "{'username': '" + $('#username').val() + "'}",
        statusCode: {
            200: function () {
                username = $('#username').val();
            },
            404: function () {
                //window.location.reload();
            }
        }
    });
}

function updateHandle() {
    $.ajax({
        type: "POST",
        url: "/api/profile/updateHandle",
        dataType: 'json',
        async: true,
        data: "{'handle': '" + $('#handle').val() + "'}",
        statusCode: {
            200: function () {
                handle = $('#handle').val();
            },
            404: function () {
                //window.location.reload();
            }
        }
    });
}

function updateEmail() {
    $.ajax({
        type: "POST",
        url: "/api/profile/updateEmail",
        dataType: 'json',
        async: true,
        data: "{'email': '" + $('#email').val() + "'}",
        statusCode: {
            200: function () {
                email = $('#email').val();
            },
            404: function () {
                //window.location.reload();
            }
        }
    });
}

function updatePassword() {
    $.ajax({
        type: "POST",
        url: "/api/profile/updatePassword",
        dataType: 'json',
        async: true,
        data: "{'password': '" + sha256($('#password-new').val()) + "'}",
        statusCode: {
            200: function () {
                //window.location.reload();
            },
            404: function () {
                //window.location.reload();
            }
        }
    });
}


function loadPosts(limit, offset) {
    $("#load_more div").css("display", "block");
    $("#load_more p").css("display", "none");
    $.ajax({
        type: "GET",
        url: "/api/post/getpostsbyuser?id=" + profileId + "&limit=" + limit + "&offset=" + offset,
        async: true,
        statusCode: {
            200: function (res) {
                if (res.trim().length === 0) {
                    $(".profile-posts #load_more").css("display", "none");
                }
                $(".profile-posts #load_more").before(res);
                $("#load_more div").css("display", "none");
                $("#load_more p").css("display", "block");
                checkEdit();
            }
        }
    });
}

function loadMorePosts(n) {
    loadPosts(n, offset);
    offset = offset + n;
}




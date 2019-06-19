$(document).ready(function() {
    $(".chat_carousel_person").on("click", function () {
        changeChatWindow($(this).data("id"));
    });
});

function changeChatWindow(id) {
    $.ajax({
        type: "GET",
        url: "/api/dm?id=" + id,
        async: true,
        statusCode: {
            200: function (res) {
                $(".chat_messages").html(res);
            }
        }
    });
}

function sendMessage(message, recipient) {
    $.ajax({
        type: "POST",
        url: "/api/dm",
        dataType: 'json',
        async: true,
        data: "{" +
            "'message': '" + message + "', " +
            "'recipient': '" + recipient +
            "'}",
        statusCode: {
            200: function () {
            }
        }
    });
}
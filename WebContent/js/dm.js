$(document).ready(function() {
    $(".chat_carousel_person").on("click", function () {
        changeChatWindow($(this).data("id"));
    });

    $(".chat_send_button").on("click", function () {
        if ($(".post-textarea").val().length > 0) {
            sendMessage($(".post-textarea").val(), current_chat_id)
        }
    });

    current_chat_id = $(".chat_carousel_person").first().data("id");
    changeChatWindow(current_chat_id);
});

var current_chat_id;

function changeChatWindow(id) {
    $(".post-textarea").val("");
    current_chat_id = id;
    $(".chat_messages").html(
        "       <div class='spinner spinner-border' role='status' style='margin-left: 50%'>" +
        "                <span class='sr-only'>Loading...</span>" +
        "       </div>"
    );
    $(".chat_carousel_person").each(function() {
        if ($(this).data("id") === id) {
            $(this).find("img").addClass("chat_active");
            $(this).find("span").remove();
        } else {
            $(this).find("img").removeClass("chat_active");
        }
    });
    $.ajax({
        type: "GET",
        url: "/api/dm?id=" + id,
        async: true,
        statusCode: {
            200: function (res) {
                var data = JSON.parse(res);
                $(".chat_messages").html("");
                for (var i = 0; i < data.messages.length; i++) {
                    $(".chat_messages").append(
                        "<div class='" + (data.messages[i].user_id_from === id.toString() ? "message_received" : "message_sent") + "'>" + data.messages[i].message + "</div>"
                    );
                    scrollChatToBottom();
                }
            }
        }
    });
}

function scrollChatToBottom() {
    $(".chat_messages")[0].scrollTop = $(".chat_messages")[0].scrollHeight;
}

function sendMessage(message, recipient) {
    $(".chat_messages").append(
        "<div class='message_sent'>" + message + "</div>"
    );
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
                $(".post-textarea").val("");
                scrollChatToBottom();
            }
        }
    });
}

function markasread(id) {
    $.ajax({
        type: "POST",
        url: "/api/markasread",
        dataType: 'json',
        async: true,
        data: "{" +
            "'id': '" + id + "'}",
        statusCode: {
            200: function () {
            }
        }
    });
}

function msToTime(duration) {
    var milliseconds = parseInt((duration%1000)/100)
        , seconds = parseInt((duration/1000)%60)
        , minutes = parseInt((duration/(1000*60))%60)
        , hours = parseInt((duration/(1000*60*60))%24);

    hours = (hours < 10) ? "0" + hours : hours;
    minutes = (minutes < 10) ? "0" + minutes : minutes;
    seconds = (seconds < 10) ? "0" + seconds : seconds;

    return hours + ":" + minutes + ":" + seconds + "." + milliseconds;
}
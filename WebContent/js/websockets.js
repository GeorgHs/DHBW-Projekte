$(document).ready(function () {
    if (jwt !== null || jwt !== undefined) {
        var socket = new WebSocket("ws://localhost:8080/push?token=" + jwt);
        //console.log(jwt, socket)

        socket.onopen = function () {
            // socket.send("Here's some text that the server is urgently awaiting!");
        };

        socket.onmessage = function (event) {
            var data = JSON.parse(event.data);
            console.log("New Message: ", data);
            if (data.type === "info") {
                showinfo("Information", data.message);
            } else if (data.type === "message") {
                var data = JSON.parse(data.message);
                showinfo("Messages", "<b>New Message from " + data.username_from + ":</b> " + data.message);
                if (current_chat_id == data.id_from) {
                    $(".chat_messages").append(
                        "<div class='message_received'>" + data.message + "</div>"
                    );
                    scrollChatToBottom();
                    markasread(data.id_from);
                } else {
                    $(".chat_carousel_person").each(function() {
                        if ($(this).data("id") == data.id_from) {
                            var count = parseInt($(this).find("span").text());
                            if (!isNaN(count)) {
                                count++;
                                $(this).find("span").text(count);
                            } else {
                                $(this).prepend("<span class=\"badge badge-danger\">1</span>");
                            }

                        }
                    });
                }
            }
        }
    }
});
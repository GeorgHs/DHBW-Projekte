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
                if (current_chat_id === data.id_from) {
                    $(".chat_messages").append(
                        "<div class='message_received'>" + data.message + "</div>"
                    );
                    scrollChatToBottom();
                    markasread(data.id_from);
                } else {
                    $(".chat_carousel_person").each(function() {
                        if ($(this).data("id") === data.id_from) {
                            var count = parseInt($(this).find("span").text());
                            if (!isNaN(count)) {
                                count++;
                                $(this).find("span").text(count);
                            } else {
                                $(this).prepend("<span class=\"badge badge-danger\">1</span>");
                            }

                        } else {
                            $(".chat_carousel").append("" +
                                "           <div class=\"chat_carousel_person\" data-id=\"" + data.id_from + "\">\n" +
                                "               <span class=\"badge badge-danger\">1</span>\n" +
                                "               <img class=\"profile-image\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"" + data.username_from + "\" src=\"data:image;base64,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\">\n" +
                                "            </div>");
                            $('[data-toggle="tooltip"]').tooltip()
                        }
                    });
                }
            }
        }
    }
});
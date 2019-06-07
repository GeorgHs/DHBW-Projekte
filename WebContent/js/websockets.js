$(document).ready(function () {
    if (jwt !== null || jwt !== undefined) {
        var socket = new WebSocket("ws://localhost:8080/push?token=" + jwt);
        //console.log(jwt, socket)

        socket.onopen = function () {
            socket.send("Here's some text that the server is urgently awaiting!")
        };

        socket.onmessage = function (event) {
            var data = JSON.parse(event.data);
            console.log("New Message: ", data);
            if (data.type === "info") {
                showinfo("Information", data.message);
            }
        }
    }
});
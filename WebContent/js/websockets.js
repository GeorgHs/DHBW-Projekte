$(document).ready(function () {
    if (jwt !== null || jwt !== undefined) {
        var socket = new WebSocket("ws://localhost:8080/push?token=" + jwt);
        //console.log(jwt, socket)

        socket.onopen = function () {
            socket.send("Here's some text that the server is urgently awaiting!");
        };

        socket.onmessage = function (event) {
            console.log("New Message: ", event.data);
        }
    }
});
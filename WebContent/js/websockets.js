$(document).ready(function () {
    if (jwt !== null || jwt !== undefined) {
        var socket = new WebSocket("ws://localhost:8080/push?token=" + jwt);
        console.log(jwt, socket)
    }
});
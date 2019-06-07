var jwt;

$(document).ready(function () {

    function readCookie(name) {
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) === " ") c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
        }
        return null;
    }

    jwt = readCookie("token");

    $("#logoutbtn").on("click", function() {
        document.cookie = "token=null;path=/;expires=Thu, 01 Jan 1970 00:00:01 GMT";
        location.replace("/login");
    });

});

function showinfo(title, message){
    $("body").append("<div class=\"toast\" role=\"alert\" aria-live=\"assertive\" aria-atomic=\"true\" data-delay=\"5000\">\n" +
        "                <div class=\"toast-header\">\n" +
        "                    <strong class=\"mr-auto\">" + title + "</strong>\n" +
        "                    <small>now</small>\n" +
        "                    <button type=\"button\" class=\"ml-2 mb-1 close\" data-dismiss=\"toast\" aria-label=\"Close\">\n" +
        "                        <span aria-hidden=\"true\">&times;</span>\n" +
        "                    </button>\n" +
        "                </div>\n" +
        "                <div class=\"toast-body\">\n" +
        "                    "+ message +"\n" +
        "                </div>\n" +
        "            </div>");
    $('.toast').toast('show')
}
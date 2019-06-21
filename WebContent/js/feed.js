$(document).ready(function() {
    loadMorePosts(10);
    loadMoreSuggestions(3);
});

var offset = 0;
var sug_offset=0;

//Bild in base64 umwandeln
function base64(file, callback){
    var coolFile = {};
    function readerOnload(e){
        var base64 = btoa(e.target.result);
        coolFile.base64 = base64;
        callback(coolFile)
    };

    if(file[0].files[0] !== undefined) {
        var reader = new FileReader();
        reader.onload = readerOnload;

        var file = file[0].files[0];
        coolFile.filetype = file.type;
        coolFile.size = file.size;
        coolFile.filename = file.name;
        reader.readAsBinaryString(file);
    }else{
        callback(coolFile.base64 = "");
    }
}

//Posts laden
function loadPosts(limit, offset) {
    $("#load_more div").css("display", "block");
    $("#load_more p").css("display", "none");
    $.ajax({
        type: "GET",
        url: "/api/post/getposts?limit=" + limit + "&offset=" + offset,
        async: true,
        statusCode: {
            200: function (res) {
                if (res.trim().length === 0) {
                    $(".feed_center #load_more").css("display", "none");
                }
                $(".feed_center #load_more").before(res);
                $("#load_more div").css("display", "none");
                $("#load_more p").css("display", "block");
            }
        }
    });
}

//Posts laden und offset anpassen
function loadMorePosts(n) {
    loadPosts(n, offset);
    offset = offset + n;
}

//Vorschläge laden
function loadSuggestions(limit, offset) {
    $("#load_more_sug div").css("display", "block");
    $("#load_more_sug p").css("display", "none");
    $.ajax({
        type: "GET",
        url: "/api/profile/getsuggestions?limit=" + limit + "&offset=" + offset,
        async: true,
        statusCode: {
            200: function (res) {
                if (res.trim().length === 0) {
                    $(".feed_left #load_more_sug").css("display", "none");
                }
                $("#load_more_sug").before(res);
                $("#load_more_sug div").css("display", "none");
                $("#load_more_sug p").css("display", "block");
            }
        }
    });
}

//Mehr Vorschläge laden und offset anpassen
function loadMoreSuggestions(n) {
    loadSuggestions(n, sug_offset);
    sug_offset = sug_offset + n;
}


//Folgen
function follow(id, button) {
    $.ajax({
        type: "POST",
        url: "/api/profile/follow",
        dataType: 'json',
        async: true,
        data: "{'id': '" + id + "'}",
        statusCode: {
            200: function () {
                $(button).toggleClass("btn-primary");
                $(button).toggleClass("btn-secondary");
                if ($(button).text() === "Folgen") {
                    $(button).text("Unfollow");
                }else {
                    $(button).text("Folgen");
                }
            },
            404: function () {
                //window.location.reload();
            }
        }
    });
}

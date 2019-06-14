$(document).ready(function() {
    loadPosts(10, 0);
});

var offset = 0;

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

function loadMorePosts(n) {
    loadPosts(n, offset);
    offset = offset + n;
}
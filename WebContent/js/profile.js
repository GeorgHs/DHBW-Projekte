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
function changeModal(type) {
    if(type === 'title'){
        $('.send').attr("onclick","convertToBase64('titlepicture')");
    }else if(type === 'profile'){
        $('.send').attr("onclick","convertToBase64('profilepicture')");
    }
}

function convertToBase64(picture) {
    if ($('#profilePicture')[0].files[0] !== undefined) {
        base64($('#profilePicture'), function (data) {
            $.ajax({
                type: "POST",
                url: "/api/profile/" + picture,
                dataType: 'json',
                async: true,
                data: "{'picture': '" + data.base64 + "'}",
                statusCode: {
                    200: function () {
                        $('.cancel').click();
                        if(picture === 'titlepicture') {
                            $('.title-picture-wrapper').attr("style", "background: url('data:image; base64," + data.base64+"'");
                        }else{
                            $('.profile-image').attr("src", "data:image; base64," + data.base64);
                        }
                    },
                    403: function () {

                    }
                }
            });
        });
    } else {
        $('.cancel').click();
    }
}
    function follow(id) {
        $.ajax({
            type: "POST",
            url: "/api/profile/follow",
            dataType: 'json',
            async: true,
            data: "{'id': '" + id+ "'}",
            statusCode: {
                200: function () {
                    //window.location.reload();
                },
                404: function () {
                    //window.location.reload();
                }
            }
        });

    }





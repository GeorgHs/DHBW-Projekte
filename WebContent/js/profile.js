function base64(file, callback){
    var coolFile = {};
    function readerOnload(e){
        var base64 = btoa(e.target.result);
        coolFile.base64 = base64;
        callback(coolFile)
    };

    var reader = new FileReader();
    reader.onload = readerOnload;

    var file = file[0].files[0];
    coolFile.filetype = file.type;
    coolFile.size = file.size;
    coolFile.filename = file.name;
    reader.readAsBinaryString(file);
}

function convertToBase64() {
    base64( $('input[type="file"]'), function(data){
        $.ajax({
            type: "POST",
            url: "/api/profile/profilepicture/",
            dataType: 'json',
            async: true,
            data: "{'picture': '" + data.base64 + "'}",
            statusCode: {
                200: function() {
                    $('.cancel').click();
                },
                403: function() {

                }
            }
        });
    });

}
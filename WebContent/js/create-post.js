//Button zum Foto für Posts auswählen
$('#choose-picture').click(function () {
    $('#get-picture').click();
});

//Foto darstellen unter halb der Textarea
$('#get-picture').change(function () {
    base64($('#get-picture'), function (data) {
        $('.new-post-media').html("<img src=data:image;base64,"+data.base64+">");
    });
});

//Wenn Enter gedrückt wird Post erstellen
$(document).on("keydown", function (e) {
    if (e.originalEvent.key === "Enter" && $('#post-textarea').val().trim() !== '' && !e.shiftKey) {

        var text = $('#post-textarea').val();
        text = text.replace(/\r?\n/g, '<br />');
        base64($('#get-picture'), function (data) {
            $.ajax({
                type: "POST",
                url: "/api/profile/post",
                dataType: 'json',
                async: true,
                data: "{text: '"+text+"', media: '"+ data.base64 +"'}",
                statusCode: {
                    200: function () {
                        $('#post-textarea').val('');
                        $('#get-picture').val('');
                        $('.new-post-media').html('');
                        var media = '';
                        if (data.base64 !== undefined){
                            media = '<img src="data:image;base64,'+data.base64+'" class="card-img-top">';
                        }
                        var post = '<div class="post card">\n' +
                            '    <div class="card-body container">\n' +
                            '        <div class="row">\n' +
                            '            <div class="post-avatar col-md-2 col-xl-1"><img src="data:image;base64,'+profilePicture+'">\n' +
                            '            </div>\n' +
                            '            <div class="col-md-10 col-xl-11">\n' +
                            '                <div class="post-header">\n' +
                            '                    <a href="/profile/'+user_id+'"><b>'+username+'</b><span\n' +
                            '                            class="handle">@'+handle+'</span></a>\n' +
                            '                    <p class="post-date">now</p>\n' +
                            '                </div>\n' +
                            '                <div class="post-content">\n' +
                            '                    <p>'+text+'</p>\n' +
                                            media +
                            '                </div>\n' +
                            '                <div class="post-footer">\n' +
                            '                    <i class="fas fa-heart" style="color: lightgray;"></i>\n' +
                            '                </div>\n' +
                            '            </div>\n' +
                            '        </div>\n' +
                            '    </div>'
                        var posts = document.getElementById("feed").innerHTML;
                        document.getElementById("feed").innerHTML = post;
                        document.getElementById("feed").innerHTML += posts;
                    },
                    404: function () {
                        // window.location.reload();
                    }
                }
            });
        });
    }
});

//Damit Zeilenumbrüche möglich sind in der Textarea
$("#post-textarea").keydown(function(e){
    if (e.originalEvent.key === "Enter" && !e.shiftKey) {
        // prevent default behavior
        e.preventDefault();
    }
});

/*löschen von Posts*/
    function deletePost(postId, obj) {
        var postCard = $(obj)[0].parentNode.parentNode;
        $.ajax({
            type: "POST",
            url: "/api/post/delete",
            dataType: 'json',
            async: true,
            data: "{id:"+postId+"}",
            statusCode: {
                204: function () {
                    $(postCard).fadeOut( 600, function () {

                    });
                },
                404: function () {
                    // window.location.reload();
                }
            }
        });
    }
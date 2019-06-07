//Button zum Foto für Posts auswählen
$('#choose-picture').click(function () {
    $('#get-picture').click();
});

//Foto darstellen unter halb der Textarea
$('#get-picture').change(function () {
    base64($('#get-picture'), function (data) {
        console.log(data.base64);
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
                        window.location.reload();
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
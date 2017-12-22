$(function() {
    var imagesPreview = function(input, placeToInsertImagePreview) {

        if (input.files) {
            var filesAmount = input.files.length;

            for (i = 0; i < filesAmount; i++) {
                var reader = new FileReader();

                reader.onload = function(event) {
                    // $($.parseHTML('<img style="width:20%; margin:10px;">')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
                    $($.parseHTML('<img style="margin:10px;">')).attr({src: event.target.result, width:"100", height:"100" }).appendTo(placeToInsertImagePreview);
                }

                reader.readAsDataURL(input.files[i]);
            }
        }

    };

    $('#pictureInput').on('change', function() {
        imagesPreview(this, '#target');
    });
});

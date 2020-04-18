$(document).on('click', '.save_to_collection_btn', function() {
    let record_id = $(this).attr('record_id')

    $.ajax({
        url: 'line_items?car_record_id=' + record_id,
        type: 'POST',
        contentType: 'application/json',
        data: "",
        success: function (response) {
            alert(response.message);
        },
        error: function () {
            alert("Error while adding item to collection");
        }
    }); 
});


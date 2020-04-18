$(document).on('click', '.save_to_collection_btn', function() {
    let record_id = $(this).attr('record_id')

    $.ajax({
        url: 'line_items',
        type: 'POST',
        data: jQuery.param({ car_record_id: record_id}) ,
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        success: function () {
            alert("Item was added to your collection");
        },
        error: function () {
            alert("Error while adding item to collection");
        }
    }); 
});


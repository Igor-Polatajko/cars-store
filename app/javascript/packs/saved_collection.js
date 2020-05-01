$(document).on('click', '.save_to_collection_btn', function() {
    let element = $(this)
    let record_id = $(element).attr('id')

    $.ajax({
        url: 'line_items?car_record_id=' + record_id,
        type: 'POST',
        contentType: 'application/json',
        dataType: 'script',
        data: "",
        success: function () {
            element.removeClass('save_to_collection_btn btn-outline-success')
            element.addClass('remove_from_collection_btn btn-success')
            element.text('Saved')
        },
        error: function () {
            alert("Error while adding item to collection");
        }
    }); 
});

$(document).on('click', '.remove_from_collection_btn', function() {
    let element = $(this)
    let record_id = $(element).attr('id')

    $.ajax({
        url: 'line_items/' + record_id,
        type: 'DELETE',
        contentType: 'application/json',
        dataType: 'script',
        data: "",
        success: function (response) {
            element.removeClass('remove_from_collection_btn btn-success')
            element.addClass('save_to_collection_btn btn-outline-success')
            element.text('Save')
        },
        error: function () {
            alert("Error while removing item from collection");
        }
    }); 
});

$(document).on('click', '#my-saved-toggle', function() {
    $('#embedded-saved-items-list').toggleClass('d-none');
    $('.coverage').toggleClass('d-none');
})

$(document).on('click', '.coverage', function() {
    $('#embedded-saved-items-list').toggleClass('d-none');
    $('.coverage').toggleClass('d-none');
})





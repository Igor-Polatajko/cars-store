$(document).on('click', '.save_to_collection_btn', function() {
    let record_id = $(this).attr('record_id')

    $.ajax({
        url: '/line_items?car_record_id=' + record_id,
        type: 'POST',
        contentType: 'application/json',
        dataType: 'script',
        data: "",
        error: function () {
            toastr.error("Error while adding item to save collection!");
        }
    }); 
});

$(document).on('click', '.remove_from_collection_btn', function() {
    let record_id = $(this).attr('record_id')

    $.ajax({
        url: '/line_items/' + record_id,
        type: 'DELETE',
        contentType: 'application/json',
        dataType: 'script',
        data: "",
        error: function () {
            toastr.error("Error while removing item from save collection!");
        }
    }); 
});

$(document).on('click', '#my-saved-toggle',show_hide_embedded_saved_collection)

$(document).on('click', '.coverage', show_hide_embedded_saved_collection)

function show_hide_embedded_saved_collection() {
    $('#embedded-saved-items-list').toggleClass('d-none');
    $('.coverage').toggleClass('d-none');
}





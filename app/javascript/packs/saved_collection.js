$(document).on('click', '.save_to_collection_btn', function() {
    let element = this
    let record_id = $(element).attr('record_id')

    $.ajax({
        url: 'line_items?car_record_id=' + record_id,
        type: 'POST',
        contentType: 'application/json',
        dataType: 'script',
        data: "",
        success: function () {
            $(element).removeClass('save_to_collection_btn')
            $(element).removeClass('btn-outline-success')
            $(element).addClass('remove_from_collection_btn')
            $(element).addClass('btn-success')
            $(element).text('Saved')

            alert("Added to saved!");
        },
        error: function () {
            alert("Error while adding item to collection");
        }
    }); 
});

$(document).on('click', '.remove_from_collection_btn', function() {
    let element = this
    let record_id = $(element).attr('record_id')

    $.ajax({
        url: 'line_items/' + record_id,
        type: 'DELETE',
        contentType: 'application/json',
        dataType: 'script',
        data: "",
        success: function (response) {
            $(element).removeClass('remove_from_collection_btn')
            $(element).removeClass('btn-success')
            $(element).addClass('save_to_collection_btn')
            $(element).addClass('btn-outline-success')
            $(element).text('Save')

            alert("Item was removed from your collection");
        },
        error: function () {
            alert("Error while removing item from collection");
        }
    }); 
});


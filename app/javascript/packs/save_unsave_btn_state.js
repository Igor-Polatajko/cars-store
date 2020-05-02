export function to_saved_state(btn_element) {
    btn_element.removeClass('save_to_collection_btn btn-outline-success')
    btn_element.addClass('remove_from_collection_btn btn-success')
    btn_element.text('Saved')
}

export function to_unsaved_state(btn_element) {
    btn_element.removeClass('remove_from_collection_btn btn-success')
    btn_element.addClass('save_to_collection_btn btn-outline-success')
    btn_element.text('Save')
}
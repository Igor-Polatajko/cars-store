import consumer from "./consumer"

consumer.subscriptions.create("SaveUnsaveActionChannel", {
  connected() {
    
  },

  disconnected() {
    
  },

  received(data) {
    let button_element = $(`#${data.record_id}`)

    if (data.action === "save") {
      console.log("here")
      button_element.removeClass('save_to_collection_btn btn-outline-success')
      button_element.addClass('remove_from_collection_btn btn-success')
      button_element.text('Saved')
    } else if (data.action === "unsave") {
      button_element.removeClass('remove_from_collection_btn btn-success')
      button_element.addClass('save_to_collection_btn btn-outline-success')
      button_element.text('Save')
    } 
  }
});

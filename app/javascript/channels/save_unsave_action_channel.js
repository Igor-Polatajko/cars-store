import consumer from "./consumer"
import {to_saved_state, to_unsaved_state} from "../packs/save_unsave_btn_state"

consumer.subscriptions.create("SaveUnsaveActionChannel", {
  connected() {
    
  },

  disconnected() {
    
  },

  received(data) {
    let button_element = $(`.record-id-${data.record_id}`)

    if (data.action === "save") {
      to_saved_state(button_element)
    } else if (data.action === "unsave") {
      to_unsaved_state(button_element)
    } 
  }
});

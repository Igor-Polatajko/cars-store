import consumer from "./consumer"
import { get_cookie } from "../packs/cookies"
import { to_saved_state, to_unsaved_state } from "../packs/save_unsave_btn_state"

const ACTIONS = {"save": to_saved_state, "unsave": to_unsaved_state}

consumer.subscriptions.create(
  { channel: "SaveUnsaveActionChannel", socket_id: get_cookie("socket_id") },
  {
    connected() {
      
    },

    disconnected() {
      
    },

    received(data) {
      let button_element = $(`.record-id-${data.record_id}`)

      ACTIONS[data.action](button_element)
    } 
  }
);

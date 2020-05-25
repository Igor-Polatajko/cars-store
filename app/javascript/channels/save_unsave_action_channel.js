import consumer from "./consumer"
import { get_cookie } from "../packs/cookies"
import { to_saved_state, to_unsaved_state } from "../packs/save_unsave_btn_state"

const BUTTON_STATE_ACTIONS = { "save": to_saved_state, "unsave": to_unsaved_state }

consumer.subscriptions.create(
  { channel: "SaveUnsaveActionChannel", socket_id: get_cookie("socket_id") },
  {
    connected() {

    },

    disconnected() {

    },

    received(data) {

      console.log(data.message)
      if(data.action === 'warn') {
        toastr.warning(data.message)
        return
      }

      let button_element = $(`.record-id-${data.record_id}`)

      BUTTON_STATE_ACTIONS[data.action](button_element)

      toastr.success(data.message)
    }
  }
);

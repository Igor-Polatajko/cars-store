import consumer from "./consumer"
import { get_cookie } from "../packs/cookies"

consumer.subscriptions.create(  
  { channel: "SavedCollectionListingUpdatesChannel", socket_id: get_cookie("socket_id") }, 
  {
    connected() {
      
    },

    disconnected() {
      
    },

    received(data) {
      $(".embedded-saved-items-list-block").html(data.html)
    }
});

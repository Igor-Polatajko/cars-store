import consumer from "./consumer"

consumer.subscriptions.create("SavedCollectionListingUpdatesChannel", {
  connected() {
    
  },

  disconnected() {
    
  },

  received(data) {
    $(".embedded-saved-items-list-block").html(data.html)
  }
});

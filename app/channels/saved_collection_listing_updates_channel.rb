class SavedCollectionListingUpdatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "saved_collection_listing_updates"
  end

  def unsubscribed
   
  end
end

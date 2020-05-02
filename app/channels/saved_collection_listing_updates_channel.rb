class SavedCollectionListingUpdatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "saved_collection_listing_updates_#{params[:socket_id]}"
  end

  def unsubscribed
   
  end
end

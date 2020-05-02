class SaveUnsaveActionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "save_unsave_updates_#{params[:socket_id]}"
  end

  def unsubscribed
    
  end
end

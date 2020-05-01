class SaveUnsaveActionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "save_unsave_channel"
  end

  def unsubscribed
    
  end
end

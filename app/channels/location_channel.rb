class LocationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "location_#{params[:location_id]}"
  end
end

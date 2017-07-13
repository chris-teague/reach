class Location < ApplicationRecord
  attr_accessor :expires_in_mins

  belongs_to :user

  before_create :set_expires_at
  after_update :broadcast_lat_lng

  scope :current, -> { where("locations.expires_at > ?", Time.zone.now) }

  validates :expires_in_mins, presence: true, numericality: true, on: :create

  MIN_SHARING_TIME = 10.minutes

  def expires_in_seconds
    expires_at - Time.zone.now
  end

  def expired?
    expires_at < Time.zone.now
  end

  def set_expires_at
    self.expires_in_mins ||= MIN_SHARING_TIME
    self.expires_at = (Time.zone.now + expires_in_mins.to_i.minutes)
  end

  def broadcast_lat_lng
    return if expired?
    ActionCable.server.broadcast "location_#{id}", { lat: lat, lng: lng }
  end
end

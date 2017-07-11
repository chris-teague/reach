class Location < ApplicationRecord

  attr_accessor :expires_in_mins

  before_create :set_expires_at
  before_create :set_fake_lat_lng

  validates :expires_in_mins, presence: true, numericality: true, on: :create

  MIN_SHARING_TIME = 10.minutes

  def expires_in_seconds
    expires_at - Time.zone.now
  end

  def set_expires_at
    self.expires_in_mins ||= MIN_SHARING_TIME
    self.expires_at = (Time.zone.now + expires_in_mins.to_i.minutes)
  end

  def set_fake_lat_lng
    self.lat = rand(100)
    self.lng = rand(100)
  end
end

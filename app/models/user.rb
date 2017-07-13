class User < ApplicationRecord
  attr_accessor :lat, :lng

  has_many :locations

  after_update :update_locations

  def update_locations
    return unless lat.present? && lng.present?

    locations.current.each do |location|
      location.update_attributes(lat: lat, lng: lng)
    end
  end

  def self.build(params)
    User.create!(client: params[:client], token: SecureRandom.uuid)
  end
end

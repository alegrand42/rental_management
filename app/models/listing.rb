class Listing < ApplicationRecord
  has_many :reservations
  has_many :bookings
  has_many :missions
end

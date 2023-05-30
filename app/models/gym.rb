class Gym < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :address, :description, presence: true
end

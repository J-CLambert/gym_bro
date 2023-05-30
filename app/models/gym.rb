class Gym < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, :address, :description, presence: true
end

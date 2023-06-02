class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :gym
  # validates :duration, presence: true, numericality: { only_integer: true }
  validates :user_id, :gym_id, presence: true
  # validates :start_at, presence: true
  enum status: { pending_confirmation: 0, confirmed: 1, training_ended: 2 }
end

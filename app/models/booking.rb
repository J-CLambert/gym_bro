class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :gym

  enum status: { pending_confirmation: 0, confirmed: 1, training_ended: 2 }
end

class ChangeDurationToInteger < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :duration
    add_column :bookings, :duration, :integer
  end
end

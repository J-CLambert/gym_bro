class ChangeStartAtToDateTime < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :start_at
    add_column :bookings, :start_at, :datetime
  end
end

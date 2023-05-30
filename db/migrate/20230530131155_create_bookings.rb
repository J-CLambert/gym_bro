class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :price
      t.date :start_at
      t.time :duration
      t.references :user, null: false, foreign_key: true
      t.references :gym, null: false, foreign_key: true
      t.date :traning_started_at
      t.date :traning_ended_at
      t.boolean :status

      t.timestamps
    end
  end
end

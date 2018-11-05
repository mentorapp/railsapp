class AddDatetimeToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :start_time, :datetime
  end
end

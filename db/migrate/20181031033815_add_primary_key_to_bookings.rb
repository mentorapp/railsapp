class AddPrimaryKeyToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :id, :bigint, primary_key: true
  end
end

class ChangePriceToBeAnIntegerInBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :price, :integer
  end
end

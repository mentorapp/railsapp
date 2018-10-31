class CreateJoinTableBookings < ActiveRecord::Migration[5.2]
  def change
    create_join_table :mentor, :mentee, table_name: :bookings,
     column_options: { foreign_key: { to_table: :users } } do |t|
       t.index [:mentor_id, :mentee_id]
       t.index [:mentee_id, :mentor_id]
       t.integer :price
       t.timestamps
    end
  end
end

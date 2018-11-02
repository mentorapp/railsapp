class AddStripeidToMentor < ActiveRecord::Migration[5.2]
  def change
    add_column :mentors, :stripe_user_id, :string
  end
end

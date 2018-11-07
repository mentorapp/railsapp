class AddActiveToMentor < ActiveRecord::Migration[5.2]
  def change
    add_column :mentors, :active, :boolean
  end
end

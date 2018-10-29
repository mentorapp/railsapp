class AddPurposeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :purpose, :text
  end
end

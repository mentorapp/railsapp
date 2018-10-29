class AddAboutmeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :aboutme, :text
  end
end

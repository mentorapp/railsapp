class FixAboutmeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :aboutme, :about_me
  end
end

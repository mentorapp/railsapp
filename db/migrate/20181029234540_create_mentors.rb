class CreateMentors < ActiveRecord::Migration[5.2]
  def change
    create_table :mentors do |t|
      t.references :user, foreign_key: true
      t.text :skills
      t.text :availability
      t.integer :price

      t.timestamps
    end
  end
end

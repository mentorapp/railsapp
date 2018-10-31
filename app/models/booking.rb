class Booking < ApplicationRecord
  belongs_to :mentor, foreign_key: "mentor_id", class_name: "User"
  belongs_to :mentee, foreign_key: "mentee_id", class_name: "User"
end

class Mentor < ApplicationRecord
  belongs_to :user
  validates :price, numericality: { greater_than_or_equal_to: 50, :message => 'Minimum price is $0.50'}
end

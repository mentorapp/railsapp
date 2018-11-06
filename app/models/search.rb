class Search < ApplicationRecord
    def mentors
        @mentors = find_mentors
    end

private
    def find_mentors
        mentors = Mentor.where("skills like ?", "%#{keywords}%")  if keywords.present?
        mentors = Mentor.where("price >= ?", min_price) if min_price.present?
        mentors = Mentor.where("price <= ?", max_price) if max_price.present?

        mentors
    end
end
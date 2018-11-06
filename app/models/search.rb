class Search < ApplicationRecord
    def mentors
        @mentors = find_mentors
    end

private
    def find_mentors
        mentors = Mentor.where("skills like ? AND price BETWEEN ? AND ?", "%#{keywords}%", min_price*100, max_price*100)
        mentors
    end
end
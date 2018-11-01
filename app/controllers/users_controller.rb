class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    @mentors = Mentor.all
    @my_mentor_profile = nil
    @mentors.each do |mentor|
      if mentor.user_id == current_user.id
        @my_mentor_profile = mentor
      end
    end
    @bookings = Booking.all
    @mentor_bookings = []
    @mentee_bookings = []
    @bookings.each do |booking|
      if booking.mentor_id == current_user.id
        @mentor_bookings << booking
      elsif booking.mentee_id == current_user.id
        @mentee_bookings << booking
      end
    end
  end
end

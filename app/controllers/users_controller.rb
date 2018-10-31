class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
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

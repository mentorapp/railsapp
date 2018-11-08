class BookingMailer < ApplicationMailer
  
  def new_booking_mentor
    @mentor = params[:mentor]
    @mentee = params[:mentee]
    @booking = params[:booking]
    mail(to: @mentor.user.email, subject: 'You have a new booking!')
  end

  def new_booking_mentee
    @mentor = params[:mentor]
    @mentee = params[:mentee]
    @booking = params[:booking]
    mail(to: @mentee.email, subject: 'You have made a booking!')
  end
end

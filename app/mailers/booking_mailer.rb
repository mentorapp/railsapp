class BookingMailer < ApplicationMailer
  
  def new_booking_mentor
    @mentor = params[:mentor]
    @mentor_user = @mentor.user
    @mentee = params[:mentee]
    mail(to: @mentor.user.email, subject: 'You have a new booking!')
  end

  def new_booking_mentee
    @mentor = params[:mentor]
    @mentor_user = @mentor.user
    @mentee = params[:mentee]
    mail(to: @mentee.email, subject: 'You have made a booking!')
  end
end

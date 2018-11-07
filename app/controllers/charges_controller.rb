class ChargesController < ApplicationController

  def new
  end
  
  def create

    @mentor = Mentor.find(params[:mentor_id])
  
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @mentor.price,
      :description => "Mentor session with #{@mentor.user.username}",
      :currency    => 'aud',
      # Sends payment to the mentor
      :destination => {
        :amount => @mentor.price,
        :account => @mentor.stripe_user_id,
      }
    )

    # puts charge.inspect
    
    # If the charge is successful, create a booking in the system and send out the emails. If its not, the rescue will come into effect.
    
    unless charge.nil?
      # The charge is going through but it is not saving a booking as the datetime field is causing it to rollback.
      bookingtime = params[:booking]
      start_time = Time.new(bookingtime["start_time(1i)"].to_i, 
                bookingtime["start_time(2i)"].to_i, 
                bookingtime["start_time(3i)"].to_i, 
                bookingtime["start_time(4i)"].to_i,
                bookingtime["start_time(5i)"].to_i)
      Booking.create({mentor_id: @mentor.user_id, mentee_id: current_user.id, price: @mentor.price, charge_id: charge.id, start_time: start_time})
      BookingMailer.with(mentee: current_user, mentor: @mentor).new_booking_mentor.deliver_now
      BookingMailer.with(mentee: current_user, mentor: @mentor).new_booking_mentee.deliver_now
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end

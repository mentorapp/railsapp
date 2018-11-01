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
        :description => @mentor.price,
        :currency    => 'aud'
      )

    # This is commented out until we have a registered MailGun domain that can send to any email address.
    #@mentor = Mentor.find(1)
    #BookingMailer.with(mentee: current_user, mentor: @mentor).new_booking_mentor.deliver_now
    #BookingMailer.with(mentee: current_user, mentor: @mentor).new_booking_mentee.deliver_now

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end

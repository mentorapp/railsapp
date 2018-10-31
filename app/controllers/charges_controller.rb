class ChargesController < ApplicationController
    def new
    end
    
    def create

      @mentor.price = params[:mentor][:price].to_f * 100
    
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
    
      ProductMailer.with(user: current_user, product: @mentor, price: @mentor.price).new_purchase.deliver_now

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end

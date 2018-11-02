class UsersController < ApplicationController
  before_action :authenticate_user!

  def stripe_connect
    # Stripe brings the user back with an authorization code in the URL
    code = params[:code]

    # To finish the OAuth flow, we exchange this code for an access token and stripe user id
    response = HTTParty.post("https://connect.stripe.com/oauth/token", 
      :query => { 
        client_secret: ENV.fetch('SECRET_KEY'), 
        code: code, 
        grant_type: "authorization_code"
      }
    )

    if response.key?("error")
      # Something went wrong. E.g. the code expired
      redirect_to users_show_url, notice: response["error_description"]
    else
      # Success! :party_parrot:
      @mentor = Mentor.find_by(user_id: current_user.id)
      @mentor.stripe_user_id = response["stripe_user_id"]
      @mentor.save
      'Successfully connected with Stripe!'
    end
  end

  def show
    @user = User.find(current_user.id)
    @my_mentor_profile = Mentor.find_by(user_id: current_user.id)
    if params[:code]
      notice = stripe_connect
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

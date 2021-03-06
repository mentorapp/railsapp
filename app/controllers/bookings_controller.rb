class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  # GET /products
  # GET /products.json
  def index
    @bookings = Booking.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
   @mentor = User.find(@booking.mentor_id)
  end

  # GET /products/new
  def new
    @booking = Booking.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @booking = Booking.new(booking_params)
    @mentor = Mentor.find_by(user_id: @booking.mentor_id)
    @mentee = current_user
    BookingMailer.with(mentee: @mentee, mentor: @mentor, booking: @booking).new_booking_mentor.deliver_now
    BookingMailer.with(mentee: @mentee, mentor: @mentor, booking: @booking).new_booking_mentee.deliver_now
    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      result = params.require(:booking).permit(:mentor_id, :mentee_id, :price, :charge_id, :start_time)
      result[:mentee_id] = current_user.id
      result[:price] = result[:price].to_f * 100.0
      result
    end
end

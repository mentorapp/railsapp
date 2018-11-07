class MentorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mentor, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @mentors = []
      search = params[:search].capitalize
      @mentors = Mentor.joins(:user).where("username ILIKE ?", "%#{search}%")
      @mentors
    else
      @mentors = Mentor.all
    end
  end

  def show
  end

  def new
    @mentor = Mentor.new
  end

  def edit
    unless current_user.id == Mentor.find(params[:id]).user_id
      redirect_to users_show_path, notice: 'You are not authorised to edit that profile.'
    end
  end

  def create
  end

  def update
    unless current_user.id == Mentor.find(params[:id]).user_id
      redirect_to users_show_path, notice: 'You are not authorised to edit that profile.'
    end
    if @mentor.update(mentor_params)
      if params[:deactivate] == '1'
        @mentor.update(active: false)
        redirect_to users_show_path, notice: 'You have successfully deactivated your mentor profile'
      elsif params[:activate] == '1'
        @mentor.update(active: true)
        redirect_to users_show_path, notice: 'You have successfully re-activated your mentor profile'
      else
        redirect_to users_show_path, notice: 'You have successfully updated your details'
      end
    else
      render :edit
    end
  end

  def destroy
    if Booking.find_by(mentor_id: @mentor.user_id).nil?
      unless current_user.id == Mentor.find(params[:id]).user_id
        redirect_to users_show_path, notice: 'You are not authorised to edit that profile.'
      end
      if @mentor.destroy
        redirect_to users_show_path, notice: 'Mentor profile successfully deleted'
      else
        redirect_to users_show_path, notice: 'Mentor profile could not be deleted at this time. Please contact app owners.'
      end
    else
      redirect_to edit_mentor_path, notice: 'Error: You can not delete your account because you still have booking sessions to attend to. Please deactivate your account to prevent further bookings'
    end
  end

  private

  def set_mentor
    @mentor = Mentor.find(params[:id])
  end
  # Takes the user_id of the user who elected to become a mentor and uses this as a foreign key in the mentors table to connect a mentor profile with a user.
  def mentor_params
    result = params.require(:mentor).permit(:user_id, :skills, :availability, :price)
    result[:user_id] = current_user.id
    result[:price] = result[:price].to_f * 100.0
    result
  end
end

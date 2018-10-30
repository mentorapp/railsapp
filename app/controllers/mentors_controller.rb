class MentorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @mentors = Mentor.all
    @users
  end

  def show
    @mentor = Mentor.find(params[:id])
  end

  # Called when a user elects to become a mentor - creates a Mentor object and saves it to the database in the mentors table.
  def create
    @mentor = Mentor.new(mentor_params(params[:user_id]))
  end

  private

  # Takes the user_id of the user who elected to become a mentor and uses this as a foreign key in the mentors table to connect a mentor profile with a user.
  def mentor_params(user_id)
    result = params.require(:mentor).permit(:user_id, :skills, :availability, :price)
    result[:user_id] = user_id
    result
  end
end

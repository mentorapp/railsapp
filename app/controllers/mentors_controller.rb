class MentorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @mentors = Mentor.all
  end

  def show
    @mentor = Mentor.find(params[:id])
  end

  def create
  end

  private

  # Takes the user_id of the user who elected to become a mentor and uses this as a foreign key in the mentors table to connect a mentor profile with a user.
  def mentor_params
    result = params.require(:mentor).permit(:user_id, :skills, :availability, :price)
    result[:user_id] = current_user.id
    result
  end
end

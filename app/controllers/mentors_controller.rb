class MentorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mentor, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @mentors = []
      search = params[:search].capitalize
      users = User.where("username ILIKE ?", "%#{search}%")
      @mentors = users.map do |user|
        Mentor.find_by(user_id: user.id)
      end 
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
  end

  def create
  end

  def update
    if @mentor.update(mentor_params)
      redirect_to users_show_path
    else
      render :edit
    end
  end

  def destroy
    @mentor.destroy
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

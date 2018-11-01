class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.create!(sign_up_params)
    session[:user_id] = @user.id
    # If the user selects the 'Mentor' checkbox this param will be equal to 1 and this if statement will call create on the Mentor model.
    if params[:mentor] == "1"
      Mentor.create({user_id: @user.id})
    end
    redirect_to root_path
  end

  private

  # def user_params
  #   params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar, :purpose, :about_me)
  # end

  # def account_update_params
  #   params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  # end
end
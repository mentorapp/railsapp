class RegistrationsController < Devise::RegistrationsController
  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end

  def account_update_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end
end
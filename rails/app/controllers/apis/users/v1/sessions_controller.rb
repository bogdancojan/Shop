class Apis::Users::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by_email(user_params[:email])

    array = []
    if @user
      if @user.valid_password?(user_params[:password])
        array << get_formated_user(@user)
      else
        array << { "message": "Wrong password." }
      end
    else
      array << { "message": "Wrong user." }
    end

    render json: array
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def get_formated_user(user)
    formatted_user = {
      id: user.id,
      email: user.email
    }
  end
end

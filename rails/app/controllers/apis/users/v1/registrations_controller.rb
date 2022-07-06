class Apis::Users::V1::RegistrationsController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      head 200
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
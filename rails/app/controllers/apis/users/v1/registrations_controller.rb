class Apis::Users::V1::RegistrationsController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      head 200
    end
  end

  def destroy
    @user = User.find_by_email(user_params[:email])
    @user.destroy

    if @user.destroyed?
      render json: [ { message: "User destroyed successfully !" } ]
    end
  end

  def update
    @user = User.find(user_new_pass_params[:id])

    if @user.update(user_new_pass_params)
      render json: [ { message: "Password changed successfully !" } ]
    end
  end

  private
    def user_new_pass_params
      params.require(:user).permit(:id, :password, :password_confirmation)
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end

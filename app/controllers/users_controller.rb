class UsersController < ApplicationController
  def create
    @user = User.new(create_user_params)

    if @user.save
      token = JsonWebToken.encode({ user_id: @user.id })
      response = {
        auth_token: token,
        message: 'Account has been created.'
      }

      render json: response, status: :created
    else
      response = {
        message: @user.errors
      }

      render json: response, status: :unauthorized
    end
  end

  private

  def create_user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :username,
      :password,
      :password_confirmation
    )
  end
end

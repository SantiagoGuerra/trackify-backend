class AuthenticationController < ApplicationController
  def login
    @user = User.find_by(username: login_params[:username])

    if @user&.authenticate(login_params[:password])
      token = JsonWebToken.encode({ user_id: @user.id })
      response = {
        message: 'Login sucessfully!',
        auth_token: token
      }

      render(json: response, status: :ok)
    else
      response = {
        message: "Access denied"
      }
      render(json: response, status: :unauthorized)
    end
  end

  private

  def login_params
    params.require(:user).permit(:username, :password)
  end
end

class ApplicationController < ActionController::API
  def auth_request
    auth_header = request.headers['Authorization']
    encoded_token = auth_header.split(' ').last if auth_header
    begin
      @decoded_token = JsonWebToken.decode(encoded_token)
      @current_user = User.find(@decoded_token[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end

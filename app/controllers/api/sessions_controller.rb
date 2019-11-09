class Api::SessionsController < Api::BaseController
  skip_before_action :authenticate_user!
  def create
    user = User.find_by_email(session_params[:email])
    if user&.valid_password?(session_params[:password])
      render json: user.as_json(only: [:id, :authentication_token, :role]), status: 201
    else
      render json: { message: 'Authentication failed.' }, status: 401
    end
  end

  private
  def session_params
    params.permit(:email, :password)
  end
end

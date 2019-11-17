class Api::SessionsController < Api::BaseController
  def create
    user = User.find_by_email(session_params[:email])
    if user&.valid_password?(session_params[:password])
      render json: user.as_json(only: [:id, :authentication_token, :role, :name]), status: 201
    else
      render json: { message: 'Authentication failed.' }, status: 401
    end
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end

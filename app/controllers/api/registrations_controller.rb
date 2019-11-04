class Api::RegistrationsController < Api::BaseController
  skip_before_action :authenticate_user!
  def create
    user = User.new(sign_up_params)
    if user.errors.full_messages.empty? && user.save
      render json: user.as_json(only: [:id, :authentication_token]), status: 201
    else
      render json: { message: user.errors.full_messages }, status: 400
    end
  end

  private

  def sign_up_params
    params.permit(:email, :password, :name)
  end
end
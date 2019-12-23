class Api::RegistrationsController < Api::BaseController
  before_action :set_user, only: [:update]
  before_action :check_if_admin?, only: [:update, :index]

  def create
    user = User.new(sign_up_params)
    if user.errors.full_messages.empty? && user.save
      render json: user.as_json(only: [:id, :authentication_token, :role, :name]), status: 201
    else
      render json: { message: user.errors.full_messages }, status: 400
    end
  end

  def index
    render json: User.all
  end

  def update
    if @user.update(sign_up_params)
      render json: { message: 'Successfully updated.' }
    else
      render json: { message: @user.errors.full_messages }, status: 400
    end
  end

  private

    def set_user
        @user = User.find(params[:id])
    end

    def sign_up_params
      params.require(:user).permit(:email, :password, :name, :role)
    end
end

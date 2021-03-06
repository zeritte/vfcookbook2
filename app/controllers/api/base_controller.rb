class Api::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json

  helper_method :current_user
  def current_user
    @current_user
  end

  def set_current_user
    @current_user = User.where(authentication_token: request.headers['token']).first
  end

  def authenticate_user!
    @current_user = User.where(authentication_token: request.headers['token']).first
    if !@current_user
      render json: { message: 'Unauthorized.' }, status: 404
      return
    end
  end

  def check_if_admin?
    authenticate_user!
    if @current_user
      unless @current_user.try(:role) == 'admin'
        render json: { message: 'You must be an admin.' }, status: 401
        return
      end
    end
  end

end

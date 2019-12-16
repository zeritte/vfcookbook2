class Api::ImpactsController < Api::BaseController
  def index
    render json: Impact.all
  end
end

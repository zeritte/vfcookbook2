class Api::TctypesController < Api::BaseController
  def index
    render json: Tctype.all
  end
end

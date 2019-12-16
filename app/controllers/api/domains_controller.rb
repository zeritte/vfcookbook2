class Api::DomainsController < Api::BaseController
  def index
    render json: Domain.all
  end
end

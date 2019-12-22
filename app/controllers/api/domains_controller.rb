class Api::DomainsController < Api::BaseController
  before_action :set_domain, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin?, only: [:create, :edit, :update, :destroy]

  def index
    render json: Domain.all
  end

  def show
    render json: @domain
  end

  def create
    @domain = Domain.new(domain_params)
    if @domain.save
        render json: { message: 'Successfully created.' }
      else
        render json: { message: @domain.errors.full_messages }, status: 400
      end
  end

  def update
    if @domain.update(domain_params)
      render json: { message: 'Successfully updated.' }
    else
      render json: { message: @domain.errors.full_messages }, status: 400
    end
  end

  def destroy
    if @domain.destroy
      render json: { message: 'Successfully destroyed.' }
    else
      render json: { message: @domain.errors.full_messages }, status: 400
    end
  end

  private

    def set_domain
      @domain = Domain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def domain_params
      params.require(:domain).permit(:name, :description)
    end
end

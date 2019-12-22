class Api::ImpactsController < Api::BaseController
  before_action :set_impact, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin?, only: [:create, :edit, :update, :destroy]

  def index
    render json: Impact.all
  end

  def show
    render json: @impact
  end

  def create
    @impact = Impact.new(impact_params)
    if @impact.save
        render json: { message: 'Successfully created.' }
      else
        render json: { message: @impact.errors.full_messages }, status: 400
      end
  end

  def update
    if @impact.update(impact_params)
      render json: { message: 'Successfully updated.' }
    else
      render json: { message: @impact.errors.full_messages }, status: 400
    end
  end

  def destroy
    if @impact.destroy
      render json: { message: 'Successfully destroyed.' }
    else
      render json: { message: @impact.errors.full_messages }, status: 400
    end
  end

  private

    def set_impact
      @impact = Impact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def impact_params
      params.require(:impact).permit(:name, :description)
    end
end

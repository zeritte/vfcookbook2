class Api::VfCasesController < Api::BaseController
  before_action :set_vf_case, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :new, :destroy]

  def index
    render json: VfCase.all
  end

  def show
    render json: @vf_case
  end

  def dashboard
    render json: VfCase.all.as_json(only: [:id, :name])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_vf_case
    @vf_case = VfCase.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vf_case_params
    params.require(:vf_case).permit(:name, :case_class, :is_active, :domain_id, :impact_id, :tctype_id)
  end
end

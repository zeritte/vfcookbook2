class Api::VfCasesController < Api::BaseController
  before_action :set_vf_case, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :new, :destroy]

  def index
    render json: ActiveModel::Serializer::CollectionSerializer.new(VfCase.all, serializer: VfCaseListSerializer)
  end

  def show
    render json: @vf_case
  end

   def create
    @vf_case = Solution.new(solution_params)
    if current_user.member?
      render json: { message: 'Members can not create or update cases.' }, status: 401
      return
    end
    if @solution.save
      render json: { message: 'Successfully created.' }
    else
      render json: { message: @vf_case.errors.full_messages }, status: 400
    end
  end

  def update
    if current_user.member?
      render json: { message: 'Members can not create or update cases.' }, status: 401
      return
    end
    if @vf_case.update(vf_case_params)
      render json: { message: 'Successfully updated.' }
    else
      render json: { message: @vf_case.errors.full_messages }, status: 400
    end
  end

  def destroy
    if @vf_case.destroy
      render json: { message: 'Successfully destroyed.' }
    else
      render json: { message: @vf_case.errors.full_messages }, status: 400
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
  def set_vf_case
    @vf_case = VfCase.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vf_case_params
    params.require(:vf_case).permit(:name, :case_class, :is_active, :domain_id, :impact_id, :tctype_id, :documentation, :content_en, :content_de, :case_id)
  end
end

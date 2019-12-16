class Api::SolutionsController < Api::BaseController
  before_action :set_solution, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :new, :destroy]
  before_action :set_current_user, only: [:index, :create, :update]

  def index
    if current_user
      @solutions = Solution.all.where(is_approved: true).or(Solution.where(created_by_id: current_user.id))
      render json: @solutions
    else
      render json: Solution.all.where(is_approved: true)
    end
  end

  def show
    render json: @solution
  end

  def create
    @solution = Solution.new(solution_params)
    @solution.created_by_id = current_user.id
    unless current_user.member?
      @solution.is_approved = true
    end
    if @solution.save
      if @solution.is_approved
        render json: { message: 'Successfully created.' }
      else
        render json: { message: 'It will be shown to everyone after reviewed.' }
      end
    else
      render json: { message: @solution.errors.full_messages }, status: 400
    end
  end

  def update
    if @solution.created_by.id != current_user.id && current_user.member?
      render json: { message: 'You can only edit your own solution.' }, status: 400
      return
    end
    if current_user.member?
      @solution.is_approved = false
    else
      @solution.is_approved = true
    end
    if @solution.update(solution_params)
      if @solution.is_approved
        render json: { message: 'Successfully updated.' }
      else
        render json: { message: 'It will be shown to everyone after reviewed.' }
      end
    else
      render json: { message: @solution.errors.full_messages }, status: 400
    end
  end

  def destroy
    if @solution.destroy
      render json: { message: 'Successfully destroyed.' }
    else
      render json: { message: @solution.errors.full_messages }, status: 400
    end
  end

  def waiting_list
    render json: { message: Solution.where(is_approved: false) }
  end

  private

  def set_solution
    @solution = Solution.find(params[:id])
  end

  def solution_params
    params.require(:solution).permit(:before_en, :after_en, :before_de, :after_de, :vf_case_id, :is_approved, :footnote_en, :footnote_de)
  end
end

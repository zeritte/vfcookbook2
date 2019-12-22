class Api::TctypesController < Api::BaseController
  before_action :set_tctype, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin?, only: [:create, :edit, :update, :destroy]

  def index
    render json: Tctype.all
  end

  def show
    render json: @tctype
  end

  def create
    @tctype = Tctype.new(tctype_params)
    if @tctype.save
        render json: { message: 'Successfully created.' }
      else
        render json: { message: @tctype.errors.full_messages }, status: 400
      end
  end

  def update
    if @tctype.update(tctype_params)
      render json: { message: 'Successfully updated.' }
    else
      render json: { message: @tctype.errors.full_messages }, status: 400
    end
  end

  def destroy
    if @tctype.destroy
      render json: { message: 'Successfully destroyed.' }
    else
      render json: { message: @tctype.errors.full_messages }, status: 400
    end
  end

  private

    def set_tctype
      @tctype = Tctype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tctype_params
      params.require(:tctype).permit(:name, :description)
    end
end

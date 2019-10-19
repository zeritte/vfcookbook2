class VfCasesController < ApplicationController
  before_action :set_vf_case, only: [:show, :edit, :update, :destroy]

  # GET /vf_cases
  # GET /vf_cases.json
  def index
    @vf_cases = VfCase.all
  end

  # GET /vf_cases/1
  # GET /vf_cases/1.json
  def show
  end

  # GET /vf_cases/new
  def new
    @vf_case = VfCase.new
  end

  # GET /vf_cases/1/edit
  def edit
  end

  # POST /vf_cases
  # POST /vf_cases.json
  def create
    @vf_case = VfCase.new(vf_case_params)

    respond_to do |format|
      if @vf_case.save
        format.html { redirect_to @vf_case, notice: 'Vf case was successfully created.' }
        format.json { render :show, status: :created, location: @vf_case }
      else
        format.html { render :new }
        format.json { render json: @vf_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vf_cases/1
  # PATCH/PUT /vf_cases/1.json
  def update
    respond_to do |format|
      if @vf_case.update(vf_case_params)
        format.html { redirect_to @vf_case, notice: 'Vf case was successfully updated.' }
        format.json { render :show, status: :ok, location: @vf_case }
      else
        format.html { render :edit }
        format.json { render json: @vf_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vf_cases/1
  # DELETE /vf_cases/1.json
  def destroy
    @vf_case.destroy
    respond_to do |format|
      format.html { redirect_to vf_cases_url, notice: 'Vf case was successfully destroyed.' }
      format.json { head :no_content }
    end
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

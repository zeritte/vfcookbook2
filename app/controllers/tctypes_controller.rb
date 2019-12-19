class TctypesController < ApplicationController
  before_action :set_tctype, only: [:show, :edit, :update, :destroy]

  # GET /tctypes
  # GET /tctypes.json
  def index
    @tctypes = Tctype.all
  end

  # GET /tctypes/1
  # GET /tctypes/1.json
  def show
  end

  # GET /tctypes/new
  def new
    @tctype = Tctype.new
  end

  # GET /tctypes/1/edit
  def edit
  end

  # POST /tctypes
  # POST /tctypes.json
  def create
    @tctype = Tctype.new(tctype_params)

    respond_to do |format|
      if @tctype.save
        format.html { redirect_to @tctype, notice: 'Tctype was successfully created.' }
        format.json { render :show, status: :created, location: @tctype }
      else
        format.html { render :new }
        format.json { render json: @tctype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tctypes/1
  # PATCH/PUT /tctypes/1.json
  def update
    respond_to do |format|
      if @tctype.update(tctype_params)
        format.html { redirect_to @tctype, notice: 'Tctype was successfully updated.' }
        format.json { render :show, status: :ok, location: @tctype }
      else
        format.html { render :edit }
        format.json { render json: @tctype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tctypes/1
  # DELETE /tctypes/1.json
  def destroy
    @tctype.destroy
    respond_to do |format|
      format.html { redirect_to tctypes_url, notice: 'Tctype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tctype
      @tctype = Tctype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tctype_params
      params.require(:tctype).permit(:name, :description)
    end
end

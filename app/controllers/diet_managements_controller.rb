class DietManagementsController < ApplicationController
  before_action :set_diet_management, only: %i[ show edit update destroy ]

  # GET /diet_managements or /diet_managements.json
  def index
    @diet_managements = DietManagement.all
  end

  # GET /diet_managements/1 or /diet_managements/1.json
  def show
  end

  # GET /diet_managements/new
  def new
    @diet_management = DietManagement.new
  end

  # GET /diet_managements/1/edit
  def edit
  end

  # POST /diet_managements or /diet_managements.json
  def create
    @diet_management = DietManagement.new(diet_management_params)

    respond_to do |format|
      if @diet_management.save
        format.html { redirect_to diet_management_url(@diet_management), notice: "Diet management was successfully created." }
        format.json { render :show, status: :created, location: @diet_management }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @diet_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diet_managements/1 or /diet_managements/1.json
  def update
    respond_to do |format|
      if @diet_management.update(diet_management_params)
        format.html { redirect_to diet_management_url(@diet_management), notice: "Diet management was successfully updated." }
        format.json { render :show, status: :ok, location: @diet_management }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @diet_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diet_managements/1 or /diet_managements/1.json
  def destroy
    @diet_management.destroy

    respond_to do |format|
      format.html { redirect_to diet_managements_url, notice: "Diet management was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diet_management
      @diet_management = DietManagement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def diet_management_params
      params.require(:diet_management).permit(:name, :menu)
    end
end

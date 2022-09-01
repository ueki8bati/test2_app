class ManagementsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_management, only: %i[ show edit update destroy ]

  # GET /managements or /managements.json
  def index
    @managements = Management.all
  end

  # GET /managements/1 or /managements/1.json
  def show
  end

  # GET /managements/new
  def new
    @management = Management.new
  end

  # GET /managements/1/edit
  def edit
  end

  # POST /managements or /managements.json
  def create
    @management = Management.new(management_params)
    @management.user_id = current_user.id
    respond_to do |format|
      if @management.save
        format.html { redirect_to management_url(@management), notice: "Management was successfully created." }
        format.json { render :show, status: :created, location: @management }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @management.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /managements/1 or /managements/1.json
  def update
    if @management.user_id == current_user.id
      respond_to do |format|
        if @management.update(management_params)
          format.html { redirect_to management_url(@management), notice: "Management was successfully updated." }
          format.json { render :show, status: :ok, location: @management }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @management.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to @management, notice: "You don't have permission."
    end
  end

  # DELETE /managements/1 or /managements/1.json
  def destroy
    if @management.user_id == current_user.id
      @management.destroy
      msg = "Management was successfully destroyed."
    else
      msg = "You don't have permission."
    end
    respond_to do |format|
      format.html { redirect_to managements_url, notice: msg }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_management
      @management = Management.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def management_params
      params.require(:management).permit(:user_id, :category_id, :menu)
    end
end

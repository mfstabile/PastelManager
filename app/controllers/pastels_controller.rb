class PastelsController < ApplicationController
  before_action :set_pastel, only: [:show, :edit, :update, :destroy]

  # GET /pastels
  # GET /pastels.json
  def index
    @pastels = Pastel.all
  end

  # GET /pastels/1
  # GET /pastels/1.json
  def show
  end

  # GET /pastels/new
  def new
    @pastel = Pastel.new
  end

  # GET /pastels/1/edit
  def edit
  end

  # POST /pastels
  # POST /pastels.json
  def create
    @pastel = Pastel.new(pastel_params)

    respond_to do |format|
      if @pastel.save
        format.html { redirect_to @pastel, notice: 'Pastel was successfully created.' }
        format.json { render :show, status: :created, location: @pastel }
      else
        format.html { render :new }
        format.json { render json: @pastel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pastels/1
  # PATCH/PUT /pastels/1.json
  def update
    respond_to do |format|
      if @pastel.update(pastel_params)
        format.html { redirect_to @pastel, notice: 'Pastel was successfully updated.' }
        format.json { render :show, status: :ok, location: @pastel }
      else
        format.html { render :edit }
        format.json { render json: @pastel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pastels/1
  # DELETE /pastels/1.json
  def destroy
    @pastel.destroy
    respond_to do |format|
      format.html { redirect_to pastels_url, notice: 'Pastel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pastel
      @pastel = Pastel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pastel_params
      params.require(:pastel).permit(:nome)
    end
end

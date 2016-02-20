class AcordesController < ApplicationController
  before_action :set_acorde, only: [:show, :edit, :update, :destroy]

  # GET /acordes
  # GET /acordes.json
  def index
    @acordes = Acorde.all
  end

  # GET /acordes/1
  # GET /acordes/1.json
  def show
  end

  # GET /acordes/new
  def new
    @acorde = Acorde.new
  end

  # GET /acordes/1/edit
  def edit
  end

  # POST /acordes
  # POST /acordes.json
  def create
    @acorde = Acorde.new(acorde_params)

    respond_to do |format|
      if @acorde.save
        format.html { redirect_to @acorde, notice: 'Acorde was successfully created.' }
        format.json { render :show, status: :created, location: @acorde }
      else
        format.html { render :new }
        format.json { render json: @acorde.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acordes/1
  # PATCH/PUT /acordes/1.json
  def update
    respond_to do |format|
      if @acorde.update(acorde_params)
        format.html { redirect_to @acorde, notice: 'Acorde was successfully updated.' }
        format.json { render :show, status: :ok, location: @acorde }
      else
        format.html { render :edit }
        format.json { render json: @acorde.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acordes/1
  # DELETE /acordes/1.json
  def destroy
    @acorde.destroy
    respond_to do |format|
      format.html { redirect_to acordes_url, notice: 'Acorde was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acorde
      @acorde = Acorde.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acorde_params
      params.require(:acorde).permit(:song_id, :acorde)
    end
end

class AcordesController < ApplicationController
  before_action :set_acorde, only: [:show, :edit, :update, :destroy]
  before_action :set_song
  before_action :set_cantante

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
    @acorde = @song.acordes.new
  end

  # GET /acordes/1/edit
  def edit
  end

  # POST /acordes
  # POST /acordes.json
  def create
    @acorde = @song.acordes.new(acorde_params)
    respond_to do |format|
      if @acorde.save
        format.html { redirect_to cantante_song_path(@cantante, @song), notice: 'Tu versión fue creada.' }
      else
        format.html { redirect_to new_cantante_song_acorde_path(@cantante, @song), notice: 'Algo ha fallado!' }
      end
    end
  end

  # PATCH/PUT /acordes/1
  # PATCH/PUT /acordes/1.json
  def update
    respond_to do |format|
      if @acorde.update(acorde_params)
        format.html { redirect_to cantante_song_path(@cantante, @song), notice: 'Cambios guardados.' }
      else
        format.html { redirect_to cantante_song_path(@cantante, @song), notice: 'Algo ha fallado.' }
      end
    end
  end

  # DELETE /acordes/1
  # DELETE /acordes/1.json
  def destroy
    @acorde.destroy
    respond_to do |format|
      format.html { redirect_to cantante_song_path(@cantante, @song), notice: 'Acorde was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_cantante
      @cantante = Cantante.friendly.find(params[:cantante_id])
    end
    def set_song
      @song = Song.friendly.find(params[:song_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_acorde
      @acorde = Acorde.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acorde_params
      params.require(:acorde).permit(:song_id, :acorde, :descripcion)
    end


  end

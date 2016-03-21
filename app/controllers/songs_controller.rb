class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :set_cantante

  def new
    @song = Song.new
  end
  def show
    @title =  "Acordes " + @song.nombre
  end

  def edit
  end

  def create
    @song = @cantante.songs.new(song_params)
    @song.cantante = @cantante

    respond_to do |format|
      if @song.save
        format.html { redirect_to @cantante, notice: "El Cancion '#{@song.nombre}' fue agregado con exito." }
      else
        format.html { redirect_to new_cantante_song_path(@cantante) }
      end
    end
  end

  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @cantante, notice: "#{@song.nombre} fue actualizado " }
      else
        format.html { render edit_cantante_song_path(@cantante, @song) }
      end
    end
  end

  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to @cantante, notice: "La Cancion fue Borrada" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cantante
      @cantante = Cantante.friendly.find(params[:cantante_id])
    end
    def set_song
      @song = Song.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:nombre, :song, :descripcion, :album_id)
    end
end

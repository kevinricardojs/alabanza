class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :set_cantante

  def new
    @album = Album.new
  end
  
  def show
    @songs = @album.songs
  end

  def edit
  end

  def create
    @album = @cantante.albums.new(album_params)
    @album.cantante = @cantante

    respond_to do |format|
      if @album.save
        format.html { redirect_to @cantante, notice: "El album '#{@album.nombre}' fue agregado con exito." }
      else
        format.html { render new_cantante_album_path(@cantante) }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album.cantante, notice: "#{@album.nombre} fue actualizado " }
      else
        format.html { render edit_cantante_album_path(@cantante, @album) }
      end
    end
  end

  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to @cantante, notice: "El Album fue borrado" }
    end
  end

  private
  def set_cantante
    @cantante = Cantante.find(params[:cantante_id])
  end
  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:nombre, :year)
  end
end

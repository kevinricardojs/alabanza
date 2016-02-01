class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :set_cantante

  def new
    @album = Album.new
  end
  
  def show
    @acordes = @album.acordes
  end

  def edit
  end

  def create
    @album = @cantante.albums.new(album_params)
    @album.cantante = @cantante

    respond_to do |format|
      if @album.save
        format.html { redirect_to @cantante, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album.cantante, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    cantante = @album.cantante
    @album.destroy
    respond_to do |format|
      format.html { redirect_to cantante, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
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
    params.require(:album).permit(:nombre, :year, :cantante_id)
  end
end

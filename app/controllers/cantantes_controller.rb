class CantantesController < ApplicationController
  before_action :set_cantante, only: [:show, :edit, :update, :destroy]

  def index
    @cantantes = Cantante.all
  end

  def show
    @albumes = @cantante.albums
    @acordes = @cantante.acordes
  end

  def new
    @cantante = Cantante.new
  end

  def edit
  end

  def create
    @cantante = Cantante.new(cantante_params)

    respond_to do |format|
      if @cantante.save
        format.html { redirect_to @cantante, notice: 'Cantante was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @cantante.update(cantante_params)
        format.html { redirect_to @cantante, notice: 'Cantante was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @cantante.destroy
    respond_to do |format|
      format.html { redirect_to cantantes_url, notice: 'Cantante was successfully destroyed.' }
    end
  end

  private
    def set_cantante
      @cantante = Cantante.find(params[:id])
    end

    def cantante_params
      params.require(:cantante).permit(:nombre)
    end
end

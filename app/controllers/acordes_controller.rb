class AcordesController < ApplicationController
  before_action :set_acorde, only: [:show, :edit, :update, :destroy]
  before_action :set_cantante

  def new
    @acorde = Acorde.new
  end
  def show
  end

  def edit
  end

  def create
    @acorde = @cantante.acordes.new(acorde_params)
    @acorde.cantante = @cantante

    respond_to do |format|
      if @acorde.save
        format.html { redirect_to @cantante, notice: 'Acorde was successfully created.' }
      else
        format.html { redirect_to new_acorde_cantantes_path }
      end
    end
  end

  def update
    respond_to do |format|
      if @acorde.update(acorde_params)
        format.html { redirect_to @cantante, notice: 'Acorde was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @acorde.destroy
    respond_to do |format|
      format.html { redirect_to @cantante, notice: 'Acorde was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
     def set_cantante
      @cantante = Cantante.find(params[:cantante_id])
    end
    def set_acorde
      @acorde = Acorde.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acorde_params
      params.require(:acorde).permit(:cantante_id, :nombre, :acorde, :descripcion, :album_id)
    end
end

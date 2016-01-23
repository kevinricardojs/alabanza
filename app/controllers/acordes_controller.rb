class AcordesController < ApplicationController
  before_action :set_acorde, only: [:show, :edit, :update, :destroy]


  def show
  end

  def new
    @acorde = Acorde.new
  end

  def edit
  end

  def create
    @acorde = Acorde.new(acorde_params)

    respond_to do |format|
      if @acorde.save
        format.html { redirect_to @acorde, notice: 'Acorde was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @acorde.update(acorde_params)
        format.html { redirect_to @acorde, notice: 'Acorde was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @acorde.destroy
    respond_to do |format|
      format.html { redirect_to acordes_url, notice: 'Acorde was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acorde
      @acorde = Acorde.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acorde_params
      params.require(:acorde).permit(:cantante_id, :nombre, :acorde, :descripcion, :album_id)
    end
end

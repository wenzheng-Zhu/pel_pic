class PelcosController < ApplicationController

  before_action :set_pelco, only: [:show, :edit, :update, :destroy]


  def new
    @pelco = Pelco.new
  end

  def index
    @pelcos = Pelco.all
  end

  def show
  end

  def create
    @pelco = Pelco.new(pelco_params)
    if @pelco.save
      flash[:success] = "Pelco was successfully created"
      redirect_to pelco_path(@pelco)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @pelco.update(pelco_params)
      flash[:success] = "Pelco was successfully edited"
      redirect_to pelco_path(@pelco)
    else
      render 'edit'
    end
  end

  def destroy
    @pelco.destroy
    flash[:success] = "Pelco was successfully destroyed!!!"
    redirect_to pelcos_path
  end

  private

  def pelco_params
    params.require(:pelco).permit(:ip, :camera_name)
  end

  def set_pelco
    @pelco = Pelco.find_by(id: params[:id])
  end
end

class SpotsController < ApplicationController
  def new
    @spot = Spot.new
  end
  
  def create
    spot = Spot.new(spot_params)
    spot.save
    redirect_to spot_path(spot.id)
  end

  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def edit
    @spot = Spot.find(params[:id])
  end
  
  def update
    spot = Spot.find(params[:id])
    spot.update(spot_params)
    redirect_to spot_path(spot.id)
  end
  
  def destroy
    spot = Spot.find(params[:id])
    spot.destroy
    redirect_to '/spots'
  end
  
  private
  
  def spot_params
    params.require(:spot).permit(:person, :title, :body)
  end
  
end

class SpotsController < ApplicationController
  def new
    @spot = Spot.new
  end
  
  def create
    spot = Spot.new(spot_params)
    spot.save
    redirect_to '/top'
  end

  def index
  end

  def show
  end

  def edit
  end
  
  private
  
  def spot_params
    params.require(:spot).permit(:person, :title, :body)
  end
  
end

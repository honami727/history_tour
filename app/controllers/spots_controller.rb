class SpotsController < ApplicationController
  def new
    @spot = Spot.new
  end
  
  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      flash[:notice] = "投稿に成功しました!"
      redirect_to spot_path(@spot.id)
    else
      flash.now[:notice] = "投稿に失敗しました"
      render :new
    end
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
    params.require(:spot).permit(:person, :address, :title, :body)
  end
  
end

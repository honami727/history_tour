class Public::SpotsController < ApplicationController
  def new
    @spot = Spot.new
  end
  
  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id
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
    search_flug = false
    if params[:word].present?
      if params[:method] == "perfect"
        @spots = @spots.where("title LIKE ? or person LIKE ?", "#{params[:word]}", "#{params[:word]}")
      else
        @spots = @spots.where("title LIKE ? or person LIKE ?", "%#{params[:word]}%", "%#{params[:word]}%")
      end
      search_flug = true
    end
    if params[:category_id].present?
      @spots = @spots.where(category_id: params[:category_id])
      search_flug = true
    end
    if search_flug && @spots.count > 0
      flash.now[:notice] = "#{@spots.count}件見つかりました。"
    elsif search_flug
      flash.now[:alert] = "見つかりませんでした。"
    end
    @spots = @spots.page(params[:page])
  end

  def show
    @spot = Spot.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @spot = Spot.find(params[:id])
  end
  
  def update
    @spot = Spot.find(params[:id])
    @spot.user_id = current_user.id
    if @spot.update(spot_params)
      flash[:notice] = "更新に成功しました!"
      redirect_to spot_path(@spot.id)
    else
      flash.now[:notice] = "更新に失敗しました"
      render :edit
    end
  end
  
  def destroy
    spot = Spot.find(params[:id])
    spot.destroy
    redirect_to spots_path
  end
  
  private
  
  def spot_params
    params.require(:spot).permit(:person, :address, :title, :image, :body, :category_id)
  end
  
end

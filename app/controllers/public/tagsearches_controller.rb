class Public::TagsearchesController < ApplicationController
    
  def search
    # @model = Spot
    # @word = params[:word]
    # @spots = Spot.where("category LIKE?","%#{@word}%")
    # @categories = Category.all
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
    # @category = Category.find(params[:category_id])
    # @category.spots
    @spots = @spots.page(params[:page])
    # render "public/tagsearches/tagsearch"
  end


    
end

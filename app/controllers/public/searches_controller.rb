class Public::SearchesController < ApplicationController
    
    before_action :authenticate_user!
    
    def search
      seach_word = params[:word]
      @spots = Spot.where("title LIKE ? or person LIKE ?", "%#{seach_word}%", "%#{seach_word}%")
      if @spots.count > 0
        flash.now[:notice] = "#{@spots.count}件見つかりました。"
      else
        flash.now[:alert] = "#見つかりませんでした。"
      end
    end
    
end

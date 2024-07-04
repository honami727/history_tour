class Public::TagsearchesController < ApplicationController
    
  def search
    @model = Spot
    @word = params[:word]
    @spots = Spot.where("category LIKE?","%#{@word}%")
    render "public/tagsearches/tagsearch"
  end

    
end

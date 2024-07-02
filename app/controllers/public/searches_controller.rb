class Public::SearchesController < ApplicationController
    
    before_action :authenticate_user!
    
    def search
        @model = params[:model]
        @content = params[:content]
      if @model == "User"
        @users = User.looks(params[:search], params[:content])
      else
        @spots = Spot.looks(params[:search], params[:content])
      end
    end
    
end

class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @spots = @user.spots
    end
    
    def edit
    end
    
end

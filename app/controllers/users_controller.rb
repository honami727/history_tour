class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @spots = @user.spots.page(params[:page])
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path
    end
    
    private
  
    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
    
end

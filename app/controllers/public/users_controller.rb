class Public::UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @spots = @user.spots.page(params[:page])
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @user_id = current_user.id
        if @user.update(user_params)
          flash[:notice] = "更新に成功しました!"
          redirect_to user_path
        else
          flash.now[:notice] = "更新に失敗しました"
          render :edit
        end
    end
    
    def favorites
        @user = User.find(params[:id])
        favorites = Favorite.where(user_id: @user.id).pluck(:spot_id)
        @favorite_spots = Spot.where(id: favorites)
        @spot = Spot.find(params[:id])
        page = params[:page] || 1
        @favorite_spots = @favorite_spots.page(page)
    end
    
    private
  
    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
    
    def is_matching_login_user
      @user = User.find(params[:id])
      unless @user.id == current_user.id
        redirect_to user_path(current_user)
      end
    end
    
    def set_user
      @user = User.find(params[:id])
    end
    
end

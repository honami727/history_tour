class Admin::UsersController < AdminController
    
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to admin_dashboards_path, notice: 'Successfully deleted user!'
    end
    
end

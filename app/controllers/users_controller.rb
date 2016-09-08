class UsersController < ApplicationController
    
     def edit
        
        @user = User.find(params[:id])

    end
    
    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
           flash[:notice] = "Профиль успешно обновлен"
           redirect_to root_path
        else
            flash[:alert] = "Что-то пошло не так дружище"
            redirect_to root_path
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:username, :avatar, :team)
    end
    
end
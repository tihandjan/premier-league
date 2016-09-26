class MainController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @news = Article.order('created_at DESC').where("category = 'news'").first(20)
        @articles = Article.order('created_at DESC').where("category = 'article'").first(4)
        @videos = Video.order('created_at DESC').first(5)
    end
    
    def change_my_team
        current_user.update_attributes(user_params)
        respond_to do |format|
           format.html { redirect_to root_path }
           format.js
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:team)    
    end
end

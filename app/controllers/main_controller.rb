class MainController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @news = Article.order('created_at DESC').where("category = 'news'").first(20)
        @articles = Article.order('created_at DESC').where("category = 'article'").first(4)
        @videos = Video.order('created_at DESC').first(5)
        @response = HTTParty.get("http://api.football-data.org/v1/competitions/426/fixtures", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
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

class MainController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @news = Article.order('created_at DESC').where("category = 'news'").first(20)
        @articles = Article.order('created_at DESC').where("category = 'article'").first(4)
        @videos = Video.order('created_at DESC').first(5)
        if Delayed::Job.count == 0
            Table.delay.set_table_data
        end
        @table = Table.all
        if Delayed::Job.count == 0
            Table.delay.set_table_data
        end
    
        @fixtures_en = Match.where(["DATE(date) = ? and league = ?", Date.today, 'apl'])
        @fixtures_it = Match.where(["DATE(date) = ? and league = ?", Date.today, 'seria-a'])
        @fixtures_sp = Match.where(["DATE(date) = ? and league = ?", Date.today, 'laliga'])
        @fixtures_ge = Match.where(["DATE(date) = ? and league = ?", Date.today, 'bundesliga'])
        @fixtures_cl = Match.where(["DATE(date) = ? and league = ?", Date.today, 'chempions-league'])

        @fixtures_en_was = Match.where(["DATE(date) = ? and league = ?", Date.today-1.days, 'apl'])
        @fixtures_it_was = Match.where(["DATE(date) = ? and league = ?", Date.today-1.days, 'seria-a'])
        @fixtures_sp_was = Match.where(["DATE(date) = ? and league = ?", Date.today-1.days, 'laliga'])
        @fixtures_ge_was = Match.where(["DATE(date) = ? and league = ?", Date.today-1.days, 'bundesliga'])
        @fixtures_cl_was = Match.where(["DATE(date) = ? and league = ?", Date.today-1.days, 'chempions-league'])

        @fixtures_en_will = Match.where(["DATE(date) = ? and league = ?", Date.today+1.days, 'apl'])
        @fixtures_it_will = Match.where(["DATE(date) = ? and league = ?", Date.today+1.days, 'seria-a'])
        @fixtures_sp_will = Match.where(["DATE(date) = ? and league = ?", Date.today+1.days, 'laliga'])
        @fixtures_ge_will = Match.where(["DATE(date) = ? and league = ?", Date.today+1.days, 'bundesliga'])
        @fixtures_cl_will = Match.where(["DATE(date) = ? and league = ?", Date.today+1.days, 'chempions-league'])
    end
    
    def change_my_team
        current_user.update_attributes(user_params)
        respond_to do |format|
           format.html { redirect_to root_path }
           format.js
        end
    end

    def policy
    end
    
    private
    
    def user_params
        params.require(:user).permit(:team)    
    end 
    
end

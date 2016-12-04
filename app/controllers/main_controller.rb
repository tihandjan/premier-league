class MainController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_games_table_data
    def index
        @news = Article.order('created_at DESC').where("category = 'news'").first(20)
        @articles = Article.order('created_at DESC').where("category = 'article'").first(4)
        @videos = Video.order('created_at DESC').first(5)
        @table = Table.all
    
        @fixtures_en = Match.where(["DATE(date) = ? and league = ?", Time.current, 'apl'])
        @fixtures_it = Match.where(["DATE(date) = ? and league = ?", Time.current, 'seria-a'])
        @fixtures_sp = Match.where(["DATE(date) = ? and league = ?", Time.current, 'laliga'])
        @fixtures_ge = Match.where(["DATE(date) = ? and league = ?", Time.current, 'bundesliga'])
        @fixtures_cl = Match.where(["DATE(date) = ? and league = ?", Time.current, 'chempions-league'])

        @fixtures_en_was = Match.where(["DATE(date) = ? and league = ?", Time.current-1.days, 'apl'])
        @fixtures_it_was = Match.where(["DATE(date) = ? and league = ?", Time.current-1.days, 'seria-a'])
        @fixtures_sp_was = Match.where(["DATE(date) = ? and league = ?", Time.current-1.days, 'laliga'])
        @fixtures_ge_was = Match.where(["DATE(date) = ? and league = ?", Time.current-1.days, 'bundesliga'])
        @fixtures_cl_was = Match.where(["DATE(date) = ? and league = ?", Time.current-1.days, 'chempions-league'])

        @fixtures_en_will = Match.where(["DATE(date) = ? and league = ?", Time.current+1.days, 'apl'])
        @fixtures_it_will = Match.where(["DATE(date) = ? and league = ?", Time.current+1.days, 'seria-a'])
        @fixtures_sp_will = Match.where(["DATE(date) = ? and league = ?", Time.current+1.days, 'laliga'])
        @fixtures_ge_will = Match.where(["DATE(date) = ? and league = ?", Time.current+1.days, 'bundesliga'])
        @fixtures_cl_will = Match.where(["DATE(date) = ? and league = ?", Time.current+1.days, 'chempions-league'])
    end
    
    def change_my_team
        cookies[:user_team] = params[:team] 
        respond_to do |format|
           format.html { redirect_to root_path }
           format.js
        end
    end

    def policy
    end

    def set_games_table_data
        if Delayed::Job.count == 0
            Match.delay.set_games
            Table.delay.set_table_data
        end
    end
    
end

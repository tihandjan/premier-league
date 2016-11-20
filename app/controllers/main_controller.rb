class MainController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @news = Article.order('created_at DESC').where("category = 'news'").first(20)
        @articles = Article.order('created_at DESC').where("category = 'article'").first(4)
        @videos = Video.order('created_at DESC').first(5)
        update_fixtures
        choose_league_table
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

    def choose_league_table
        if Table.count != 5 || (Time.current - Table.last.created_at)/60 > 60
           
            Table.destroy_all
            en = HTTParty.get("http://api.football-data.org/v1/competitions/426/leagueTable", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
            pl_sp = HTTParty.get("http://api.football-data.org/v1/competitions/436/leagueTable", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
            seria_a = HTTParty.get("http://api.football-data.org/v1/competitions/438/leagueTable", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
            bundes_liga = HTTParty.get("http://api.football-data.org/v1/competitions/430/leagueTable", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
            chemp_liga = HTTParty.get("http://api.football-data.org/v1/competitions/440/leagueTable", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
            
            Table.create!(league: 'germany', data: bundes_liga)
            Table.create!(league: 'cl', data: chemp_liga)
            Table.create!(league: 'italy', data: seria_a)
            Table.create!(league: 'spain', data: pl_sp)
            Table.create!(league: 'england', data: en)
            
            
            @response_table_bundes_liga = eval(Table.find_by(league: 'germany').data)
            @response_table_chemp_liga = eval(Table.find_by(league: 'cl').data)
            @response_table_seria_a = eval(Table.find_by(league: 'italy').data)
            @response_table_pl_sp = eval(Table.find_by(league: 'spain').data)
            @response_table = eval(Table.find_by(league: 'england').data)
            
        else
            
            @response_table_bundes_liga = eval(Table.find_by(league: 'germany').data)
            @response_table_chemp_liga = eval(Table.find_by(league: 'cl').data)
            @response_table_seria_a = eval(Table.find_by(league: 'italy').data)
            @response_table_pl_sp = eval(Table.find_by(league: 'spain').data)
            @response_table = eval(Table.find_by(league: 'england').data)
            
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:team)    
    end
    
    def update_fixtures
        if Fixture.count != 5 || (Time.current - Fixture.last.created_at)/60 > 10

                
            Fixture.destroy_all
            en = HTTParty.get("http://api.football-data.org/v1/competitions/426/fixtures", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
            pl_sp = HTTParty.get("http://api.football-data.org/v1/competitions/436/fixtures", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
            seria_a = HTTParty.get("http://api.football-data.org/v1/competitions/438/fixtures", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
            bundes_liga = HTTParty.get("http://api.football-data.org/v1/competitions/430/fixtures", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
            chemp_liga = HTTParty.get("http://api.football-data.org/v1/competitions/440/fixtures", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
            
            Fixture.create!(league: 'germany', fixture: bundes_liga)
            Fixture.create!(league: 'cl', fixture: chemp_liga)
            Fixture.create!(league: 'italy', fixture: seria_a)
            Fixture.create!(league: 'spain', fixture: pl_sp)
            Fixture.create!(league: 'england', fixture: en)
            
            @response_bundes_liga = eval(Fixture.find_by(league: 'germany').fixture)
            @response_chemp_liga = eval(Fixture.find_by(league: 'cl').fixture)
            @response_seria_a = eval(Fixture.find_by(league: 'italy').fixture)
            @response_pl_sp = eval(Fixture.find_by(league: 'spain').fixture)
            @response = eval(Fixture.find_by(league: 'england').fixture)
                
            
        else
            @response_bundes_liga = eval(Fixture.find_by(league: 'germany').fixture)
            @response_chemp_liga = eval(Fixture.find_by(league: 'cl').fixture)
            @response_seria_a = eval(Fixture.find_by(league: 'italy').fixture)
            @response_pl_sp = eval(Fixture.find_by(league: 'spain').fixture)
            @response = eval(Fixture.find_by(league: 'england').fixture)
        end
    end
    
    
end

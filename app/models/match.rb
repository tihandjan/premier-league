class Match < ActiveRecord::Base
    
    def self.set_games_premier_league
        where(league: 'en').destroy_all
        @response_pl_en = HTTParty.get("http://api.football-data.org/v1/competitions/426/fixtures", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
        
        @response_pl_en['fixtures'].each do |data|
            
            Match.create!(league: 'en',home_team: check_value(data['homeTeamName']),away_team: check_value(data['awayTeamName']),date: check_value(data['date']),status: check_value(data['status']),self_fixtures: check_value(data['_links']['self']['href']),matchday: check_value(data['matchday']),goals_home_team: check_value(data['result']['goalsHomeTeam']),goals_away_team: check_value(data['result']['goalsAwayTeam']))
         
        end
    end
    
    def self.set_games_spanish_league
        where(league: 'sp').destroy_all
        @response_pl_sp = HTTParty.get("http://api.football-data.org/v1/competitions/436/fixtures", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
        @response_pl_sp['fixtures'].each do |data|
            
            Match.create!(league: 'sp',home_team: check_value(data['homeTeamName']),away_team: check_value(data['awayTeamName']),date: check_value(data['date']),status: check_value(data['status']),self_fixtures: check_value(data['_links']['self']['href']),matchday: check_value(data['matchday']),goals_home_team: check_value(data['result']['goalsHomeTeam']),goals_away_team: check_value(data['result']['goalsAwayTeam']))
            
        end
    end
    
    def self.set_games_seria_a
        where(league: 'it').destroy_all
        @response_seria_a = HTTParty.get("http://api.football-data.org/v1/competitions/438/fixtures", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
        @response_seria_a['fixtures'].each do |data|
            
            Match.create!(league: 'it',home_team: check_value(data['homeTeamName']),away_team: check_value(data['awayTeamName']),date: check_value(data['date']),status: check_value(data['status']),self_fixtures: check_value(data['_links']['self']['href']),matchday: check_value(data['matchday']),goals_home_team: check_value(data['result']['goalsHomeTeam']),goals_away_team: check_value(data['result']['goalsAwayTeam']))
            
        end
    end
    
    def self.set_games_bundes_league
        where(league: 'ge').destroy_all
        @response_bundes_liga = HTTParty.get("http://api.football-data.org/v1/competitions/430/fixtures", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
        @response_bundes_liga['fixtures'].each do |data|
            
            Match.create!(league: 'ge',home_team: check_value(data['homeTeamName']),away_team: check_value(data['awayTeamName']),date: check_value(data['date']),status: check_value(data['status']),self_fixtures: check_value(data['_links']['self']['href']),matchday: check_value(data['matchday']),goals_home_team: check_value(data['result']['goalsHomeTeam']),goals_away_team: check_value(data['result']['goalsAwayTeam']))
            
        end
    end
    
    def self.set_games_champions_league
        where(league: 'cl').destroy_all
        @response_chemp_liga = HTTParty.get("http://api.football-data.org/v1/competitions/440/fixtures", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
        @response_chemp_liga['fixtures'].each do |data|
            
            Match.create!(league: 'cl',home_team: check_value(data['homeTeamName']),away_team: check_value(data['awayTeamName']),date: check_value(data['date']),status: check_value(data['status']),self_fixtures: check_value(data['_links']['self']['href']),matchday: check_value(data['matchday']),goals_home_team: check_value(data['result']['goalsHomeTeam']),goals_away_team: check_value(data['result']['goalsAwayTeam']))
            
        end
    end
    
    def self.check_value value
        if value
            value 
        else
            nil
        end        
    end
    
end

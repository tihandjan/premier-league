class Match < ActiveRecord::Base
    
    def self.set_games
        @response = HTTParty.get("http://api.football-data.org/v1/competitions/426/fixtures", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
        @response['fixtures'].each do |data|
            
            if data['result']['goalsHomeTeam'] || data['result']['goalsAwayTeam'] 
                Match.create!(home_team: data['homeTeamName'],away_team: data['awayTeamName'],date: data['date'],status: data['status'],self_fixtures: data['_links']['self']['href'],matchday: data['matchday'],goals_home_team: data['result']['goalsHomeTeam'],goals_away_team: data['result']['goalsAwayTeam'])
            else
                Match.create!(home_team: data['homeTeamName'],away_team: data['awayTeamName'],date: data['date'],status: data['status'],self_fixtures: data['_links']['self']['href'],matchday: data['matchday'],goals_home_team: nil,goals_away_team: nil)
            end
            
        end
    end
end

class Match < ActiveRecord::Base


    def self.set_games
        @response_en = HTTParty.get("http://api.football-data.org/v1/competitions/426/fixtures", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
        @response_sp = HTTParty.get("http://api.football-data.org/v1/competitions/436/fixtures", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
        @response_it = HTTParty.get("http://api.football-data.org/v1/competitions/438/fixtures", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
        @response_ge = HTTParty.get("http://api.football-data.org/v1/competitions/430/fixtures", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
        @response_cl = HTTParty.get("http://api.football-data.org/v1/competitions/440/fixtures", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
        
        Match.transaction do
            @data = []
            @response_en['fixtures'].each do |data|
                @data << Match.new(homeTeamName: if_nul(data['homeTeamName']),awayTeamName: if_nul(data['awayTeamName']),date: if_nul(data['date']),status: if_nul(data['status']),selfFixtures: if_nul(data['_links']['self']['href']),matchday: if_nul(data['matchday']),goalsHomeTeam: if_nul(data['result']['goalsHomeTeam']),goalsAwayTeam: if_nul(data['result']['goalsAwayTeam']), league: 'apl') 
            end
            @response_sp['fixtures'].each do |data|
                @data << Match.new(homeTeamName: if_nul(data['homeTeamName']),awayTeamName: if_nul(data['awayTeamName']),date: if_nul(data['date']),status: if_nul(data['status']),selfFixtures: if_nul(data['_links']['self']['href']),matchday: if_nul(data['matchday']),goalsHomeTeam: if_nul(data['result']['goalsHomeTeam']),goalsAwayTeam: if_nul(data['result']['goalsAwayTeam']), league: 'laliga') 
            end
            @response_it['fixtures'].each do |data|
                @data << Match.new(homeTeamName: if_nul(data['homeTeamName']),awayTeamName: if_nul(data['awayTeamName']),date: if_nul(data['date']),status: if_nul(data['status']),selfFixtures: if_nul(data['_links']['self']['href']),matchday: if_nul(data['matchday']),goalsHomeTeam: if_nul(data['result']['goalsHomeTeam']),goalsAwayTeam: if_nul(data['result']['goalsAwayTeam']), league: 'seria-a')
            end
            @response_ge['fixtures'].each do |data|
                @data << Match.new(homeTeamName: if_nul(data['homeTeamName']),awayTeamName: if_nul(data['awayTeamName']),date: if_nul(data['date']),status: if_nul(data['status']),selfFixtures: if_nul(data['_links']['self']['href']),matchday: if_nul(data['matchday']),goalsHomeTeam: if_nul(data['result']['goalsHomeTeam']),goalsAwayTeam: if_nul(data['result']['goalsAwayTeam']), league: 'bundesliga')
            end
            @response_cl['fixtures'].each do |data|
                @data << Match.new(homeTeamName: if_nul(data['homeTeamName']),awayTeamName: if_nul(data['awayTeamName']),date: if_nul(data['date']),status: if_nul(data['status']),selfFixtures: if_nul(data['_links']['self']['href']),matchday: if_nul(data['matchday']),goalsHomeTeam: if_nul(data['result']['goalsHomeTeam']),goalsAwayTeam: if_nul(data['result']['goalsAwayTeam']), league: 'chempions-league')
            end

            Match.import @data, validate: false
        end
    end

    def self.if_nul data
        if data.blank?
            'empty'
        else
            data
        end
    end

end




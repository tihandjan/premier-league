class Team < ActiveRecord::Base
    has_many :players, dependent: :destroy
    
    def self.set_teams_premier_league
        where(league: 'en').destroy_all
        @response = HTTParty.get("http://api.football-data.org/v1/competitions/426/teams", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
        
        @response['teams'].each do |data|
            Team.create!(league: 'en',name: check_value(data['name']),code: check_value(data['code']),short_name: check_value(data['shortName']),market_value: check_value(data['squadMarketValue']),fixtures: check_value(data['_links']['fixtures']['href']),icon_url: check_value(data['crestUrl']))
            @players = HTTParty.get(data['_links']['players']['href'], :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
            @players['players'].each do |player|
                Team.last.players.create(name: check_value(player['name']), position: check_value(player['position']), number: check_value(player['jerseyNumber']), date_of_birth: check_value(player['dateOfBirth']), nationality: check_value(player['nationality']), contract_until: check_value(player['contractUntil']), market_value: check_value(player['marketValue']))
            end
        end
    end
    
    def self.set_teams_spanish_league
        where(league: 'sp').destroy_all
        @response = HTTParty.get("http://api.football-data.org/v1/competitions/436/teams", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
        
        @response['teams'].each do |data|
            Team.create!(league: 'sp',name: check_value(data['name']),code: check_value(data['code']),short_name: check_value(data['shortName']),market_value: check_value(data['squadMarketValue']),fixtures: check_value(data['_links']['fixtures']['href']),icon_url: check_value(data['crestUrl']))
            @players = HTTParty.get(data['_links']['players']['href'], :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
            @players['players'].each do |player|
                Team.last.players.create(name: check_value(player['name']), position: check_value(player['position']), number: check_value(player['jerseyNumber']), date_of_birth: check_value(player['dateOfBirth']), nationality: check_value(player['nationality']), contract_until: check_value(player['contractUntil']), market_value: check_value(player['marketValue']))
            end
        end
    end
    
    def self.set_teams_seria_a
        where(league: 'it').destroy_all
        @response = HTTParty.get("http://api.football-data.org/v1/competitions/438/teams", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
        
        @response['teams'].each do |data|
            Team.create!(league: 'it',name: check_value(data['name']),code: check_value(data['code']),short_name: check_value(data['shortName']),market_value: check_value(data['squadMarketValue']),fixtures: check_value(data['_links']['fixtures']['href']),icon_url: check_value(data['crestUrl']))
            @players = HTTParty.get(data['_links']['players']['href'], :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
            @players['players'].each do |player|
                Team.last.players.create(name: check_value(player['name']), position: check_value(player['position']), number: check_value(player['jerseyNumber']), date_of_birth: check_value(player['dateOfBirth']), nationality: check_value(player['nationality']), contract_until: check_value(player['contractUntil']), market_value: check_value(player['marketValue']))
            end
        end
    end
    
    def self.set_teams_bundes_league
        where(league: 'ge').destroy_all
        @response = HTTParty.get("http://api.football-data.org/v1/competitions/430/teams", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
        
        @response['teams'].each do |data|
            Team.create!(league: 'ge',name: check_value(data['name']),code: check_value(data['code']),short_name: check_value(data['shortName']),market_value: check_value(data['squadMarketValue']),fixtures: check_value(data['_links']['fixtures']['href']),icon_url: check_value(data['crestUrl']))
            @players = HTTParty.get(data['_links']['players']['href'], :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
            @players['players'].each do |player|
                Team.last.players.create(name: check_value(player['name']), position: check_value(player['position']), number: check_value(player['jerseyNumber']), date_of_birth: check_value(player['dateOfBirth']), nationality: check_value(player['nationality']), contract_until: check_value(player['contractUntil']), market_value: check_value(player['marketValue']))
            end
        end
    end
    
    def self.set_teams_champions_league
        where(league: 'lc').destroy_all
        @response = HTTParty.get("http://api.football-data.org/v1/competitions/440/teams", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
        
        @response['teams'].each do |data|
            Team.create!(league: 'lc',name: check_value(data['name']),code: check_value(data['code']),short_name: check_value(data['shortName']),market_value: check_value(data['squadMarketValue']),fixtures: check_value(data['_links']['fixtures']['href']),icon_url: check_value(data['crestUrl']))
            @players = HTTParty.get(data['_links']['players']['href'], :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})
            @players['players'].each do |player|
                Team.last.players.create(name: check_value(player['name']), position: check_value(player['position']), number: check_value(player['jerseyNumber']), date_of_birth: check_value(player['dateOfBirth']), nationality: check_value(player['nationality']), contract_until: check_value(player['contractUntil']), market_value: check_value(player['marketValue']))
            end
        end
    end
    
    def self.check_value value
        if value.blank?
            'empty'
        else
            value
        end        
    end
    
end

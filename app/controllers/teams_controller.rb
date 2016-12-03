class TeamsController < ApplicationController
    
    def index
        redirect_to root_path    
    end

    def show
        @team = Team.find(params[:id])
        @players = @team.players
        @fixtures_prev = Match.order('date DESC').where("date BETWEEN ? AND ? and (\"homeTeamName\" = ? or \"awayTeamName\" = ?)", Time.zone.now-60.days, Time.current-2.hour, @team.name, @team.name).first(5)
        @fixtures_next = Match.order('date').where("date BETWEEN ? AND ? and (\"homeTeamName\" = ? or \"awayTeamName\" = ?)", Time.current+2.hour, Time.zone.now+60.days, @team.name, @team.name).first(5)
    end

end
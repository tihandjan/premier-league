class TeamsController < ApplicationController
    
    def index
        redirect_to root_path    
    end

    def show
        @team = Team.find(params[:id])
        @teams = Team.all
        @players = @team.players
        @news = Article.order('created_at DESC').where(team: @team.name, category: 'news').paginate(page: params[:page], per_page: 5)
        @articles = Article.order('created_at DESC').where(team: @team.name, category: 'articles').paginate(page: params[:page], per_page: 5)
        @videos = Video.order('created_at DESC').where('team_first = ? or team_second = ?', @team.name, @team.name).paginate(page: params[:page], per_page: 5)
        @table_data = Table.where(league: @team.league)
        @fixtures_prev = Match.order('date DESC').where("date BETWEEN ? AND ? and (\"homeTeamName\" = ? or \"awayTeamName\" = ?)", Time.zone.now-60.days, Time.current-2.hour, @team.name, @team.name).first(5)
        @fixtures_next = Match.order('date').where("date BETWEEN ? AND ? and (\"homeTeamName\" = ? or \"awayTeamName\" = ?)", Time.current+2.hour, Time.zone.now+60.days, @team.name, @team.name).first(5)
    end

end
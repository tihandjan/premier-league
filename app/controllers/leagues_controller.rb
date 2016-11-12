class LeaguesController < ApplicationController

  def index
    @articles = Article.paginate(page: params[:page], per_page: 7).order('created_at DESC')
    @h1 = 'привет я h1 для всех новостей/статей'
    @active = 'rest-active'
    render 'articles/index'
  end

  def show
    @news = Article.order('created_at DESC').where(category: 'news', league: params[:id]).first(20)
    @articles = Article.order('created_at DESC').where(category: 'article', league: params[:id]).first(2)
    @videos = Video.order('created_at DESC').where(league: params[:id]).first(5)
    choose_league_table

    if params[:id] == 'seria-a'
      @table_data = @response_table_seria_a
      @table_name = 'Таблица Серия А'
    elsif params[:id] == 'bundesliga'
      @table_data = @response_table_bundes_liga
      @table_name = 'Таблица Бундеслиги'
    elsif params[:id] == 'laliga'
      @table_data = @response_table_pl_sp
      @table_name = 'Таблица Ла Лиги'
    elsif params[:id] == 'chempions-league'
      @table_data = @response_table_chemp_liga
      @table_name = 'Таблица Лиги Чемпионов'
    else
      @table_data = @response_table
      @table_name = 'Таблица Английской Премьер Лиги'
    end

    render 'shared/index_league'
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

end
class LeaguesController < ApplicationController

  def index
    redirect_to root_path
  end

  def show
    @news = Article.order('created_at DESC').where(category: 'news', league: params[:id]).first(20)
    @articles = Article.order('created_at DESC').where(category: 'article', league: params[:id]).first(2)
    @videos = Video.order('created_at DESC').where(league: params[:id]).first(5)
    choose_league_table

    if params[:id] == 'seria-a'
      @table_data = @response_table_seria_a
      @table_name = 'Привет h5 Таблица Серия А'
      @h2 = 'Привет я h2'
      @h4 = 'Привет я h4'
      @league = params[:id]
      render 'shared/index_league'
    elsif params[:id] == 'bundesliga'
      @table_data = @response_table_bundes_liga
      @table_name = 'Привет h5 Таблица Бундеслиги'
      @h2 = 'Привет я h2'
      @h4 = 'Привет я h4'
      @league = params[:id]
      render 'shared/index_league'
    elsif params[:id] == 'laliga'
      @table_data = @response_table_pl_sp
      @table_name = 'Привет h5 Таблица Ла Лиги'
      @h2 = 'Привет я h2'
      @h4 = 'Привет я h4'
      @league = params[:id]
      render 'shared/index_league'
    elsif params[:id] == 'chempions-league'
      @table_data = @response_table_chemp_liga
      @table_name = 'Привет h5 Таблица Лиги Чемпионов'
      @h2 = 'Привет я h2'
      @h4 = 'Привет я h4'
      @league = params[:id]
      render 'shared/index_league'
    elsif params[:id] == 'apl'
      @table_data = @response_table
      @table_name = 'Привет h5 Таблица Английской Премьер Лиги'
      @h2 = 'Привет я h2'
      @h4 = 'Привет я h4'
      @league = params[:id]
      render 'shared/index_league'
    else
      redirect_to root_path
    end
  end

  def table
    @news = Article.order('created_at DESC').where(category: 'news', league: params[:id]).first(12)
    choose_league_table
    if params[:id] == 'seria-a'
      @name = params[:id]
      @table_data = @response_table_seria_a
      @league = params[:id]
    elsif params[:id] == 'bundesliga'
      @name = params[:id]
      @table_data = @response_table_bundes_liga
      @league = params[:id]
    elsif params[:id] == 'laliga'
      @name = params[:id]
      @table_data = @response_table_pl_sp
      @league = params[:id]
    elsif params[:id] == 'chempions-league'
      @name = params[:id]
      @table_data = @response_table_chemp_liga
      @league = params[:id]
    elsif params[:id] == 'apl'
      @name = params[:id]
      @table_data = @response_table
      @league = params[:id]
    else
      redirect_to root_path
    end
  end

  def fixtures
    @news = Article.order('created_at DESC').where(category: 'news', league: params[:id]).first(20)
    @fixtures = Match.where(['date > ? and league = ?', Time.current, 'apl'])
  end

  def choose_league_table
      if Table.count != 5 || (Time.current - Table.last.created_at)/60 > 60 && (HTTParty.get("http://api.football-data.org/v1/competitions/426/leagueTable", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})).code == 200
         
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

  def update_fixtures
        if Fixture.count != 5 || (Time.current - Fixture.last.created_at)/60 > 10 && (HTTParty.get("http://api.football-data.org/v1/competitions/426/leagueTable", :headers =>{"X-Auth-Token" => '568ace863a0348b896cc43d897338062'})).code == 200

                
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
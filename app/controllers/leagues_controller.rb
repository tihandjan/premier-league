class LeaguesController < ApplicationController

  def index
    redirect_to root_path
  end

  def show
    @news = Article.order('created_at DESC').where(category: 'news', league: params[:id]).first(20)
    @articles = Article.order('created_at DESC').where(category: 'article', league: params[:id]).first(2)
    @videos = Video.order('created_at DESC').where(league: params[:id]).first(5)
    @league = params[:id]
    if Delayed::Job.count == 0
        Table.delay.set_table_data
    end

    if params[:id] == 'seria-a'
      @table_data = Table.where(league: params[:id])
      @table_name = 'Привет h5 Таблица Серия А'
      @h2 = 'Привет я h2'
      @h4 = 'Привет я h4'
      render 'shared/index_league'
    elsif params[:id] == 'bundesliga'
      @table_data = Table.where(league: params[:id])
      @table_name = 'Привет h5 Таблица Бундеслиги'
      @h2 = 'Привет я h2'
      @h4 = 'Привет я h4'
      render 'shared/index_league'
    elsif params[:id] == 'laliga'
      @table_data = Table.where(league: params[:id])
      @table_name = 'Привет h5 Таблица Ла Лиги'
      @h2 = 'Привет я h2'
      @h4 = 'Привет я h4'
      render 'shared/index_league'
    elsif params[:id] == 'chempions-league'
      @table_data = Table.where(league: params[:id])
      @table_name = 'Привет h5 Таблица Лиги Чемпионов'
      @h2 = 'Привет я h2'
      @h4 = 'Привет я h4'
      render 'shared/index_league'
    elsif params[:id] == 'apl'
      @table_data = Table.where(league: params[:id])
      @table_name = 'Привет h5 Таблица Английской Премьер Лиги'
      @h2 = 'Привет я h2'
      @h4 = 'Привет я h4'
      render 'shared/index_league'
    else
      redirect_to root_path
    end
  end

  def table
    if Delayed::Job.count == 0
        Table.delay.set_table_data
    end
    @news = Article.order('created_at DESC').where(category: 'news', league: params[:id]).first(12)
    @league = params[:id]

    if params[:id] == 'chempions-league'
      @table = Table.where(league: params[:id])
    elsif params[:id] == 'apl' || params[:id] == 'laliga' || params[:id] == 'bundesliga' || params[:id] == 'seria-a'
      @table = Table.where(league: params[:id])
    else
      redirect_to root_path
    end
  end

  def fixtures
    
      if Delayed::Job.count == 0
        Match.delay.set_games
      end

    @news = Article.order('created_at DESC').where(category: 'news', league: params[:id]).first(20)
    @fixtures = Match.where(['date > ? and league = ?', Time.current, params[:id]])
  end

  

end
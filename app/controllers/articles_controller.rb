class ArticlesController < ApplicationController

  def index
    if params[:league_id] == 'all'
      @articles = Article.paginate(page: params[:page], per_page: 7).order('created_at DESC')
    else
      @articles = Article.paginate(page: params[:page], per_page: 7).order('created_at DESC').where(league: params[:league_id])
    end

    if params[:league_id] == 'apl'
      @h1 = "Привет я буду h1 для #{params[:league_id]}"
    elsif params[:league_id] == 'seria-a'
      @h1 = "Привет я буду h1 для #{params[:league_id]}"
    elsif params[:league_id] == 'bundesliga'
      @h1 = "Привет я буду h1 для #{params[:league_id]}"
    elsif params[:league_id] == 'laliga'
      @h1 = "Привет я буду h1 для #{params[:league_id]}"
    elsif params[:league_id] == 'chempions-league'
      @h1 = "Привет я буду h1 для #{params[:league_id]}"
    else
      @h1 = "Привет я буду h1 для новостей"
    end
  end

  def show
    @article = Article.find(params[:league], params[:id])
    @news = Article.order('created_at DESC').where(category: 'news').all_except(@article).first(15)
  end
    
end

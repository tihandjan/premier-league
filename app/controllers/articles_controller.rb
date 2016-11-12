class ArticlesController < ApplicationController

  def index
      @articles = Article.paginate(page: params[:page], per_page: 7).order('created_at DESC').where(league: params[:league_id])

    if params[:league_id] == 'apl'
      @h1 = "Привет я буду h1 для #{params[:league_id]}"
      @active = 'apl-active'
    elsif params[:league_id] == 'seria-a'
      @h1 = "Привет я буду h1 для #{params[:league_id]}"
      @active = 'seria-a-active'
    elsif params[:league_id] == 'bundesliga'
      @h1 = "Привет я буду h1 для #{params[:league_id]}"
      @active = 'bundesliga-active'
    elsif params[:league_id] == 'laliga'
      @h1 = "Привет я буду h1 для #{params[:league_id]}"
      @active = 'laliga-active'
    elsif params[:league_id] == 'chempions-league'
      @h1 = "Привет я буду h1 для #{params[:league_id]}"
      @active = 'chempions-league-active'
    end
  end

  def show
    @article = Article.find(params[:id])
    @news = Article.order('created_at DESC').where(category: 'news', league: params[:league_id]).all_except(@article).first(15)
  end
    
end

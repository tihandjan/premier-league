class ArticlesController < ApplicationController

  def index
<<<<<<< HEAD
      @articles = Article.paginate(page: params[:page], per_page: 7).order('created_at DESC').where(league: params[:league_id], category: 'article')

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
    elsif params[:league_id] == 'all'
=======
      @league = params[:league_id]
      @articles = Article.paginate(page: params[:page], per_page: 7).order('created_at DESC').where(league: @league, category: 'article')

    if @league == 'apl'
      @h1 = "Привет я буду h1 для #{@league}"
      @active = 'apl-active'
    elsif @league == 'seria-a'
      @h1 = "Привет я буду h1 для #{@league}"
      @active = 'seria-a-active'
    elsif @league == 'bundesliga'
      @h1 = "Привет я буду h1 для #{@league}"
      @active = 'bundesliga-active'
    elsif @league == 'laliga'
      @h1 = "Привет я буду h1 для #{@league}"
      @active = 'laliga-active'
    elsif @league == 'chempions-league'
      @h1 = "Привет я буду h1 для #{@league}"
      @active = 'chempions-league-active'
    elsif @league == 'all'
>>>>>>> comments
      @articles = Article.paginate(page: params[:page], per_page: 7).order('created_at DESC').where(category: 'article')
      @active = 'rest-active'
      @h1 = "Привет я буду h1 для всех статей"
    end
  end

  def show
    @article = Article.find(params[:id])
    @news = Article.order('created_at DESC').where(category: 'news', league: params[:league_id]).all_except(@article).first(15)
  end
    
end

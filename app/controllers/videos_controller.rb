class VideosController < ApplicationController
    
    def index
        @editional_class = 'articles'
        @news = Article.order('created_at DESC').where("category = 'news'").first(20)
        if params[:league_id] == 'all'
          @videos = Video.paginate(page: params[:page], per_page: 12).order('created_at DESC')
        else
          @videos = Video.paginate(page: params[:page], per_page: 12).order('created_at DESC').where(league: params[:league_id])
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
          @h1 = "Привет я буду h1 для видео"
        end
    end
    
    def show
        @editional_class = 'articles'
        @video = Video.find(params[:league], params[:id])
        @videos = Video.order('created_at DESC').first(4)
        @news = Article.order('created_at DESC').where("category = 'news'").first(12)
    end
    
end
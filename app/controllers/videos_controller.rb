class VideosController < ApplicationController
    
    def index
        @videos = Video.all
        @news = Article.order('created_at DESC').where("category = 'news'").first(20)
    end
    
    def show
        @video = Video.find(params[:id])
        @news = Article.order('created_at DESC').where("category = 'news'")
    end
    
end
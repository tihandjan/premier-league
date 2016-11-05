class VideosController < ApplicationController
    
    def index
        @videos = Video.all
        @news = Article.order('created_at DESC').where("category = 'news'").first(20)
    end
    
    def show
        @video = Video.find(params[:id])
        @videos = Video.order('created_at DESC').first(4)
        @news = Article.order('created_at DESC').where("category = 'news'").first(12)
    end
    
end
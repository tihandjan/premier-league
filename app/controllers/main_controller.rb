class MainController < ApplicationController
    
    def index
        @news = Article.order('created_at DESC').where("category = 'news'").all
        @articles = Article.order('created_at DESC').where("category = 'article'").first(2)
    end
    
end

class MainController < ApplicationController
    
    def index
        @news = Article.order('created_at DESC').where("category = 'news'").first(4)
        @articles = Article.order('created_at DESC').where("category = 'article'").first(2)
    end
    
end

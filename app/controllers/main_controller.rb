class MainController < ApplicationController
    
    def index
        @articles = Article.order('created_at DESC').where("category = 'news'").first(4)
    end
    
end

class ArticlesController < ApplicationController
 
  def show
        @article = Article.find(params[:id])
        @news = Article.order('created_at DESC').where("category = 'news'").all_except(@article)
  end
    
end

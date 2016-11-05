class ArticlesController < ApplicationController
 
  def index
    @articles = Article.order('created_at DESC').where(category: 'news').all
  end

  def news
    
  end

  def show
    @article = Article.find(params[:id])
    @news = Article.order('created_at DESC').where(category: 'news').all_except(@article).first(15)
  end
    
end

class ArticlesController < ApplicationController
 
  def index
    @articles = Article.paginate(page: params[:page], per_page: 2).order('created_at DESC').where(category: 'article')
  end

  def news
    @articles = Article.order('created_at DESC').where(category: 'news').all
  end

  def show
    @article = Article.find(params[:id])
    @news = Article.order('created_at DESC').where(category: 'news').all_except(@article).first(15)
  end
    
end

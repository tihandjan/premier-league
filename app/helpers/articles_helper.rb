module ArticlesHelper

  def link_to_news_or_article cat
    if cat == 'article'
      link_to 'Статьи', league_articles_path(@article.league)
    else
      link_to 'Новости', league_articles_path(@article.league)
    end
  end

end

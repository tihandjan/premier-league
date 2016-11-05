module ArticlesHelper

  def link_to_news_or_article cat
    if cat == 'article'
      link_to 'Статьи', articles_path
    else
      link_to 'Новости', news_path
    end
  end

end

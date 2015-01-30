module ArticlesHelper

  def article_ember_path (article)
    "http://#{request.host_with_port}/#/articles/#{article.slug}"
  end

end

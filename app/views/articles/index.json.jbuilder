json.articles do
    json.array!(@articles) do |article|
      #json.extract! article, :id
      #json.url article_url(article, format: :json)
      
          json.id article.id.to_s
          json.extract! article, :url, :title, :slug, :excerpt, :user_id, :user_name, :created_at, :updated_at
      
    end
end
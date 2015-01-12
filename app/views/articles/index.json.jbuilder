json.articles do
    
    json.array!(@articles) do |article|
      
        json.id article.id.to_s
        json.extract! article, :url, :title, :slug, :excerpt, :user_id, :user_name, :created_at, :updated_at
        #json.userVoted 
      
    end

end
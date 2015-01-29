
json.articles do
    
    json.array!(@articles) do |article|
      
        json.id article.id.to_s
        json.voteCount article.votes_count
        json.userVoted current_user.voted?(article) if current_user
        json.extract! article, :url, :title, :slug, :excerpt, :user_id, :user_name, :created_at, :updated_at
        
        json.comments article.comments do |comment|
            json.id comment.id.to_s
            json.extract! comment, :user_id, :user_name, :content, :created_at
        end

    end

end
json.id @article.id.to_s
json.vote_count @article.votes_count
json.user_voted current_user.voted?(@article) if current_user
json.extract! @article, :url, :title, :slug, :excerpt, :user_id, :user_name, :created_at, :updated_at

json.comments @article.comments do |comment|
    json.id comment.id.to_s
    json.extract! comment, :user_id, :user_name, :content, :created_at
end

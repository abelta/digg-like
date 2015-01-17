json.id @article.id.to_s
json.voteCount @article.votes_count
json.userVoted current_user.voted?(@article) if current_user
json.extract! @article, :url, :title, :slug, :excerpt, :user_id, :user_name, :created_at, :updated_at
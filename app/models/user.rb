class User < ActiveRecord::Base
  
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :name, :presence => true



  def articles
    Article.where uploader_id: self.id
  end


  def article_new (attrs)
    Article.new attrs.merge(uploader_id: self.id)
  end


  def article_create (attrs)
    Article.create attrs.merge(uploader_id: self.id)
  end


  def comment_new (article, attrs)
    article.comments.new attrs.merge(user_id: self.id)
  end


  def comment_create (article, attrs)
    article.comments.create attrs.merge(user_id: self.id)
  end

end

class User < ActiveRecord::Base
  
  #include Mongo::Voter

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :name, :presence => true



  def articles
    Article.where user_id: self.id
  end


  def article_new (attrs)
    Article.new attrs.merge(user_id: self.id, user_name: self.name)
  end


  def article_create (attrs)
    Article.create attrs.merge(user_id: self.id, user_name: self.name)
  end


  def comment_new (article, attrs)
    article.comments.new attrs.merge(user_id: self.id, user_name: self.name)
  end


  def comment_create (article, attrs)
    article.comments.create attrs.merge(user_id: self.id, user_name: self.name)
  end

end

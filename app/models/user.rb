class User < ActiveRecord::Base
  
  
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
    puts "article"
    puts article.inspect
    puts "attrs"
    puts attrs.inspect
    sleep 4

    article.comments.new attrs.merge(user_id: self.id, user_name: self.name)
  end


  def comment_create (article, attrs)
    article.comments.create attrs.merge(user_id: self.id, user_name: self.name)
  end

end

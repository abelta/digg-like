class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :name, :presence => true



  def articles
    Article.where uploader_id: self.id
  end


  def article_new (attrs)
    Article.new! attrs.merge uploader_id: self.id
  end


  def article_create (attrs)
    Article.create! attrs.merge uploader_id: self.id
  end

end

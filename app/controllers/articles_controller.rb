class ArticlesController < ApplicationController

  before_action :authenticate_user!, only:[:new, :create]
  before_action :check_url, only:[:create]


  
  def show
    @article = Article.find article_params[:id]
  end


  def new
    @article = Article.new
  end


  def create
    require 'nokogiri'
    require 'open-uri'
    
    webpage = Nokogiri::HTML( open article_params[:url] )
    
    @article = Article.create! do |article|
      article.url = article_params[:url]
      article.title = webpage.title
      article.excerpt = webpage.css('p').text.split.first(100).join(' ')
      article.user_id = current_user.id
      article.user_name = current_user.name
    end
    
    respond_to do |format|
      format.html { render :show }
      # format.json { render json: @article }
    end
  end



  protected


  def article_params
    params.require(:article).permit(:url, :id)
  end


  def check_url
    false if Article.where(url:article_params[:url]).exists?
  end

end

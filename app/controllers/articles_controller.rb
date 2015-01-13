class ArticlesController < ApplicationController

  before_action :authenticate_user!, only:[:new, :create]
  before_action :check_url, only:[:create]


  
  def index
    @articles = Article.all
  end

  
  def show
    @article = Article.find params[:id]
  end


  def new
    @article = Article.new
  end


  def create
    require 'mechanize'
    require 'nokogiri'

    
    agent = Mechanize.new
    webpage = Nokogiri::HTML( agent.get(article_params[:url]).content )
    
    @article = Article.new do |article|
      article.url = article_params[:url]
      article.title = webpage.title
      article.excerpt = webpage.css('p').text.split.first(100).join(' ')
      article.user_id = current_user.id
      #article.user_name = current_user.name
    end
    
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
      
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

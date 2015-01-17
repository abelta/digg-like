class ArticlesVotesController < ApplicationController

  before_action :authenticate_user!, only:[:new, :create]
  

  def up
    @article = Article.find params[:article_id]
    current_user.vote @article, :up

    respond_to do |format|
      if current_user.voted? @article
        format.html { redirect_to :back, flash: {success: "Voted successfully."} }
        format.json { render 'articles/show', status: :ok }
      else
        format.html { redirect_to :back, flash: {error: "There was an error there."}  }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end      
    end
  end


  def down
    @article = Article.find params[:article_id]
    current_user.vote @article, :down

    respond_to do |format|
      if current_user.voted? @article
        format.html { redirect_to :back, flash: {success: "Voted successfully."} }
        format.json { render 'articles/show', status: :ok }
      else
        format.html { redirect_to :back, flash: {error: "There was an error there."}  }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end      
    end
  end


  def undo
    @article = Article.find params[:article_id]
    
    respond_to do |format|
      if current_user.voted? @article
        current_user.unvote @article
        format.html { redirect_to :back, flash: {success: "Voted successfully."} }
        format.json { render 'articles/show', status: :ok }
      else
        format.html { redirect_to :back, flash: {error: "There was an error there."}  }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end      
    end
  end

end

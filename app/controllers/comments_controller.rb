class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :authenticate_owner, only: 'destroy'



  def create
    @article = Article.find params[:article_id]
    @comment = current_user.comment_create @article, comment_params

    respond_to do |format|
      if @article.save!
        format.json { render json: @comment, status: 'success' }
      else
        format.json { render json: @comment.errors, status: 'error' }
      end
    end
  end


  def destroy
    respond_to do |format|
      if @comment.destroy
        format.json { render json: @comment, status: 'success' }
      else
        format.json { render json: @comment.errors, status: 'error' }
      end
    end
  end



  protected


  def comment_params
    params.require(:comment).permit(:content)
  end


  def authenticate_owner
    @article = Article.find params[:article_id]
    @comment = @article.comments.find params[:id]
    @user = @comment.user
    raise "User is not owner of the comment" unless @user == current_user
  end


end

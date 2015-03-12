class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :authenticate_owner, only: 'destroy'



  def create
    @article = Article.find params[:article_id]
    @comment = @article.comments.create comment_params.merge(user_id: current_user.id)
    
    respond_to do |format|
      if @article.save!
        #format.json { render json: @comment, status: :created }
        format.json { render :show, status: :created }
      else
        format.json { render json: @comment.errors, status: :error }
      end
    end
  end


  def destroy
    respond_to do |format|
      if @comment.destroy
        format.json { render json: @comment, status: :ok }
      else
        format.json { render json: @comment.errors, status: :error }
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

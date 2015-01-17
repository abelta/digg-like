require 'rails_helper'

RSpec.describe ArticlesVotesController, :type => :controller do

  
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.env["HTTP_REFERER"] = "where_i_came_from"
    sign_out :user
    @user = create :user
    sign_in @user
  end


      
  describe "PATCH /articles/:article_id/vote/up" do
    
    it "requires login"

    it "returns http success" do
      @article = create :article
      patch :up, article_id: @article.id, format: 'json'
      expect(response).to have_http_status(:success)
    end

    it "upvotes an article" do
      @article = create :article
      expect {
        patch :up, article_id: @article.id, format: 'json'
      }.to change {@article.reload.votes_count}.by(1)
    end

  end



  describe "PATCH down" do
    
    it "requires login"

    it "returns http success" do
      @article = create :article
      patch :down, article_id: @article.id, format: 'json'
      expect(response).to have_http_status(:success)
    end

    it "downvotes an article"

  end


  describe "PATCH undo" do
    
    it "requires login"

    it "returns http success" do
      @article = create :article
      @user.vote @article, :up
      patch :undo, article_id: @article.id, format: 'json'
      expect(response).to have_http_status(:success)
    end

    it "undoes a vote to an article"

  end

end

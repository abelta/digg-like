require 'rails_helper'


RSpec.describe CommentsController, :type => :controller do


  describe 'POST /articles/:article_id/comments' do

    
    context "user is not logged in" do

      it "requires login" do
        sign_out :user
        article = create :article
        expect {
          post :create, article_id: article.id, comment: attributes_for(:comment)
        }.to raise_error
      end

    end


    context "user is logged in" do

      before :each do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        sign_out :user
        @user = create :user
        sign_in @user
      end

      context "params" do
      
        it "requires article id" do
          expect {
            post :create, comment: attributes_for(:comment)
          }.to raise_error
        end

        it "requires content" do
          article = create :article
          expect {
            post :create, article: article.attributes, comment: attributes_for(:comment, content: nil)
          }.to raise_error
        end

      end


      context "comment is valid" do

        it "adds one comment to the article" do
          article = create :article
          expect {
            post :create, article_id: article.id, comment: attributes_for(:comment), format: 'json' 
          }.to change { article.reload.comments.count }.by 1
        end

      end  

    end

  end



  describe 'DELETE /articles/:article_id/comments/:id' do

    context "user is not logged in" do

      it "requires login" do
        sign_out :user
        article = create :article
        comment = article.comments.first
        expect {
          delete :destroy, article_id: article.id, id: comment.id
        }.to raise_error
      end

    end


    context "user is logged in but is not owner of comment" do

      it "requires login" do
        sign_out :user
        article = create :article
        comment = article.comments.first
        user = create :user
        sign_in user
        expect {
          delete :destroy, article_id: article.id, id: comment.id
        }.to raise_error
      end  

    end


    context "user is logged in and is owner of comment" do

      it "removes comment from article" do
        sign_out :user
        article = create :article
        user = create :user
        sign_in user
        comment = article.comments.create attributes_for(:comment).merge(user_id:user.id)
        expect {
          delete :destroy, article_id: article.id, id: comment.id, format: 'json'
        }.to change { article.reload.comments.count }.by -1
      end

    end

  end

end

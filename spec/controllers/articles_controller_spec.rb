require 'rails_helper'
                                    


RSpec.describe ArticlesController, :type => :controller do


  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_out :user
    @user = create :user
    sign_in @user
  end


  describe 'GET /articles/new' do

    it "requires login" do
      sign_out :user
      expect {
        get :new
      }.to raise_error
    end

    it "provides a new article" do
      sign_in create(:user)
      get :new
      expect( assigns(:article) ).to be_a_new(Article)
    end

  end


  describe 'POST /articles' do

    it "requires login" do
      sign_out :user
      expect {
        post :create, article: attributes_for(:article)
      }.to raise_error
    end

    context "params" do

      it "raises error if no url is provided" do
        expect {
          post :create, article: attributes_for(:article, url:nil)
        }.to raise_error
      end

    end

    context "article already exists" do

      it "raises error" do
        create :article, url:'http://existingurl.com/example'
        expect {
          post :create, article: attributes_for(:article, url:'http://existingurl.com/example')
        }.to raise_error
      end

    end

    context "new article is created" do
      
      it "saves new article in database" do
        expect {
          post :create, article: attributes_for(:article_with_known_url)
        }.to change { Article.count }.by(1)
      end

      it "redirects to show action" do
        post :create, article: attributes_for(:article_with_known_url)
        article = Article.last
        expect( response ).to redirect_to article
      end
    end
    

  end


end

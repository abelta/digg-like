require 'rails_helper'


RSpec.describe User, :type => :model do
    
  context "validations" do
      
    it "has a valid factory" do
        expect( build(:user) ).to be_valid
    end

    it "is not valid without a name" do
      user = build :user, name: nil
      user.valid?
      expect( user.errors[:name].size ).to be >= 1
    end

    it "is not valid without a email" do
      user = build :user, email: nil
      user.valid?
      expect( user.errors[:email].size ).to be >= 1
    end

    it "is not valid without a password" do
      user = build :user, password: nil
      user.valid?
      expect( user.errors[:password].size ).to be >= 1
    end

    it "has a unique email" do
      create :user, email: "example1@gmail.com"
      user = build :user, email: "example1@gmail.com"
      user.valid?
      expect( user.errors[:email].size ).to be >= 1
    end

  end



  describe "associations with articles" do
    
    it "has many articles" do
      user = create :user
      3.times { user.articles.create attributes_for(:article) }
      expect( user.articles.count ).to eq 3
    end

    it "can post an article" do
      user = create :user
      expect {
        user.articles.create attributes_for(:article)
      }.to change { user.articles.count }.by(1)
    end

    describe "associations with comments" do
      
      it "can post a comment in an article" do
        user = create :user
        article = user.articles.create attributes_for :article
        expect {
          user.articles.first.comments.create attributes_for(:comment)
        }.to change { article.comments.count }.by(1)
      end

    end

  end



  describe "voting" do

    before do
      @user = create :user
      @article = create :article
    end

    it "can vote an article" do
      @user.vote @article, :up
      expect @user.voted?(@article)
    end

    it "can upvote an article" do
      @user.vote @article, :up
      expect @article.up_voters(User).include?(@user)
    end

    it "can downvote an article" do
      @user.vote @article, :down
      expect @article.down_voters(User).include?(@user)
    end

  end

end

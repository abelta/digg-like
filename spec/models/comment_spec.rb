require 'rails_helper'


RSpec.describe Comment, :type => :model do

  context "validations" do

    it "has a valid factory" do
      user = create :user
      article = create :article
      comment = article.comments.create attributes_for :comment
      expect( comment ).to be_valid
    end

    it "is not valid without content" do
      user = create :user
      comment = build :comment, content: nil, user_id: user.id
      comment.valid?
      expect( comment.errors[:content].size ).to be >= 1
    end

  end



  context "user" do

    it "returns authoring user" do
      user_article = create :user
      user_comment = create :user
      article = user_article.articles.create attributes_for :article
      comment = article.comments.create attributes_for :comment, user_id: user_comment.id
      expect( comment.user ).to eql user_comment
    end

    it "changes user name" do
      user1 = create :user
      user2 = create :user
      article = create :article
      comment = article.comments.create attributes_for :comment, user_id: user1.id
      comment.set user_id: user2.id
      comment.save
      expect( comment.reload.user_name ).to eql user2.name
    end

  end
  

  context "associations" do

    it "is embeded by a website" do
      relation = Comment.relations['article']
      expect( relation.klass ).to eq Article
      expect( relation.relation ).to eq Mongoid::Relations::Embedded::In
    end

  end
  
end
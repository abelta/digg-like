require 'rails_helper'


RSpec.describe Article, :type => :model do

  context "validations" do

    it "has a valid factory" do
      expect( build :article ).to be_valid
    end

    it "is not valid without a url" do
      article = build :article, url: nil
      article.valid?
      expect( article.errors[:url].size ).to be >= 1
    end

    it "is not valid with a non unique url" do
      article1 = create :article, url: 'http://url.com'
      article2 = build :article, url: 'http://url.com'
      article2.valid?
      expect( article2.errors[:url].size ).to be >= 1
    end

    it "is not valid without a title" do
      article = build :article, title: nil
      article.valid?
      expect( article.errors[:title].size ).to be >= 1
    end

    it "is not valid without a excerpt" do
      article = build :article, url: nil
      article.valid?
      expect( article.errors[:url].size ).to be >= 1
    end

  end


  context "user" do
    
    it "returns the user who uploaded the article" do
      user = create :user
      article = user.articles.create attributes_for :article
      expect( article.user ).to be_a User
    end

  end


  context "domain" do

    it "is automatically calculated from the url" do
      article = build :article, url:'http://exampledomain.com/exampletitle'
      expect( article.domain ).to eql 'exampledomain.com'
    end

  end


  context "user_name" do

    xit "can not be changed directly" do
      article = create :article
      expect { article.update_attribute :user_name, 'random_name' }.to raise_error
    end

    xit "is set when the article is created from its user" do
      user = create :user
      article = user.articles.create attributes_for :article
      expect( article.user_name ).to eql user.name
    end

    xit "is updated when the user is updated" do
      user1 = create :user
      user2 = create :user
      article = user1.articles.create attributes_for :article
      article.set :user_id, user2.id
      article.save
      expect( article.user_name ).to eql user2.name
    end

  end


  context "associations" do

    it "embeds many comments" do
      relation = Article.relations['comments']
      expect( relation.klass ).to eq Comment
      expect( relation.relation ).to eq Mongoid::Relations::Embedded::Many
    end

  end

end
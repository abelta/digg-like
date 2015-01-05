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

    xit "is not valid without a excerpt" do
      article = build :article, url: nil
      article.valid?
      expect( article.errors[:url].size ).to be >= 1
    end

    xit "is not valid without a content" do
      article = build :article, content: nil
      article.valid?
      expect( article.errors[:content].size ).to be >= 1
    end

    it "is not valid without a user_id" do
      article = build :article, user_id: nil
      article.valid?
      expect( article.errors[:user_id].size ).to be >= 1
    end


    xit "is not valid without a user_name" do
      article = build :article, user_name: nil
      article.valid?
      expect( article.errors[:user_name].size ).to be >= 1
    end


  end
  


  context "initialize" do
     
    xit "can't be initialized without a user" do
      expect { new Article }.to raise_error
    end

    xit "has a user name that matches that of the one who uploaded it" do
      article = build :article
      user = User.find article.user_id
      expect( article.user_name ).to eq user.name
    end

  end


  context "user" do
    
    it "returns the user who uploaded the article" do
      article = create :article
      expect( article.user ).to be_a User
    end

    it "only allows read of user_id" do
      article = create :article
      expect { article.update_attribute :user_id, '1' }.to raise_error
    end

  end


  context "domain" do

    it "is automatically calculated from the url" do
      article = build :article, url:'http://exampledomain.com/exampletitle'
      expect( article.domain ).to eql 'exampledomain.com'
    end

  end


  context "user_name" do

    it "can not be changed directly" do
      article = create :article
      expect { article.update_attribute :user_name, 'random_name' }.to raise_error
    end

    it "is set when the article is created from its user" do
      article = create :article
      user = article.user
      expect( article.user_name ).to eql user.name
    end

    xit "is updated when the user is updated" do
      article = build :article
      user = create :user
      article.user = user
      expect( article.user_name ).to eql user.name
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